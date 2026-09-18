# -----------------------------------------------------------------------------
# LOCAL VARIABLES (Konfigurasi 4 VM)
# -----------------------------------------------------------------------------
locals {
  vms = {
    "debian-1" = {
      name             = "vm-debian12-01"
      os_publisher     = "debian"
      os_offer         = "debian-12"
      os_sku           = "12-gen2"
      os_version       = "latest"
      assign_public_ip = true
    }
    "ubuntu-1" = {
      name             = "vm-ubuntu24-01"
      os_publisher     = "Canonical"
      os_offer         = "ubuntu-24_04-lts"
      os_sku           = "server"
      os_version       = "latest"
      assign_public_ip = true
    }
    "ubuntu-2" = {
      name             = "vm-ubuntu24-02"
      os_publisher     = "Canonical"
      os_offer         = "ubuntu-24_04-lts"
      os_sku           = "server"
      os_version       = "latest"
      assign_public_ip = true
    }
    "ubuntu-3" = {
      name             = "vm-ubuntu24-03"
      os_publisher     = "Canonical"
      os_offer         = "ubuntu-24_04-lts"
      os_sku           = "server"
      os_version       = "latest"
      assign_public_ip = false # HANYA menggunakan IP Privat
    }
  }
}

# -----------------------------------------------------------------------------
# 1. RESOURCE GROUP
# -----------------------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# -----------------------------------------------------------------------------
# 2. VIRTUAL NETWORK / VPC & SUBNET
# -----------------------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-main"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-main"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# -----------------------------------------------------------------------------
# 4. FIREWALL (Network Security Group) - ALLOW ALL IP
# -----------------------------------------------------------------------------
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-allow-all"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowAllInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  # Menjamin Subnet sudah siap sebelum asosiasi NSG dibuat
  depends_on = [
    azurerm_subnet.subnet
  ]
}

# -----------------------------------------------------------------------------
# 3. IP STATIC & NETWORK INTERFACE (NIC)
# -----------------------------------------------------------------------------
resource "azurerm_public_ip" "pip" {
  for_each            = { for k, v in local.vms : k => v if v.assign_public_ip }
  name                = "pip-${each.key}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  for_each            = local.vms
  name                = "nic-${each.key}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    
    public_ip_address_id          = each.value.assign_public_ip ? azurerm_public_ip.pip[each.key].id : null
  }

  # Menjamin Subnet sudah siap sebelum NIC dibuat
  depends_on = [
    azurerm_subnet.subnet
  ]
}

# -----------------------------------------------------------------------------
# 1. VIRTUAL MACHINES
# -----------------------------------------------------------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = local.vms
  name                            = each.value.name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.os_publisher
    offer     = each.value.os_offer
    sku       = each.value.os_sku
    version   = each.value.os_version
  }
}

# -----------------------------------------------------------------------------
# 5. BLOCK STORAGE
# -----------------------------------------------------------------------------
resource "azurerm_managed_disk" "disk" {
  for_each             = local.vms
  name                 = "disk-${each.key}"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.block_storage_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  for_each           = local.vms
  managed_disk_id    = azurerm_managed_disk.disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[each.key].id
  lun                = "10"
  caching            = "ReadWrite"
}

# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------
output "public_ip_addresses" {
  description = "Daftar Alamat IP Statis Publik yang berhasil dibuat (3 IP)"
  value = {
    for k, v in azurerm_public_ip.pip : k => v.ip_address
  }
}