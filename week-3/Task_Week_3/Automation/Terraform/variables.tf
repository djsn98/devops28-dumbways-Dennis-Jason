variable "resource_group_name" {
  type        = string
  default     = "rg-multivm-demo"
  description = "Nama Resource Group Azure"
}

# 1. Pindah ke East US untuk menghindari kehabisan stok SKU
variable "location" {
  type        = string
  default     = "South Africa North" 
  description = "Lokasi region Azure"
}

# 2. Gunakan 1 vCPU per VM agar total 4 VM pas dengan kuota (4 vCPU)
variable "vm_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "Spesifikasi server kecil (1 vCPU, 1 GB RAM)"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Username admin untuk semua VM"
}

variable "admin_password" {
  type        = string
  default     = "P@ssw0rd12345!" 
  sensitive   = true
  description = "Password admin untuk semua VM"
}

variable "block_storage_size_gb" {
  type        = number
  default     = 64
  description = "Ukuran Block Storage tambahan (Managed Disk) per VM dalam GB"
} 

variable "ssh_public_key_path" {
  type        = string
  default     = "C:/Users/Dennis Jason/.ssh/azure_key.pub" # Sesuaikan path ini dengan lokasi public key Anda
  description = "Path lokasi file SSH Public Key"
}