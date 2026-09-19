# Task Week 3

LINK REPORT VIDEO :  https://drive.google.com/file/d/1uEqgXomxLpqOMUvTNN372dt0HxbmpOAX/view?usp=sharing

## [Terraform]

Dengan mendaftar akun free tier AWS/GCP/Azure, buatlah Infrastructre dengan terraform menggunakan registry yang sudah ada. dengan beberapa aturan berikut :

- Buatlah 2 buah server dengan OS ubuntu 24 dan debian 11 (Untuk spec menyesuaikan)
  
  ![Server Ubuntu 24 dan Debian 11 (1/2)](images/image-01.png)
  
  ![Server Ubuntu 24 dan Debian 11 (2/2)](images/image-02.png)
- attach vpc ke dalam server tersebut
  
  ![VPC yang di-attach ke server](images/image-03.png)
- attach ip static ke vm yang telah kalian buat
  
  ![IP static yang di-attach ke VM](images/image-04.png)
- pasang firewall ke dalam server kalian dengan rule {allow all ip(0.0.0.0/0)}
  
  ![Firewall dengan rule allow all IP (0.0.0.0/0)](images/image-05.png)
- buatlah 2 block storage di dalam terraform kalian, lalu attach block storage tersebut ke dalam server yang ingin kalian buat. (pasang 1 ke server ubuntu dan 1 di server debian)
  
  ![Block storage yang di-attach ke server](images/image-06.png)
- test ssh ke server
  
  - vm debian 12
    
    ![Test SSH ke VM Debian 12](images/image-07.png)
  - vm ubuntu 24
    
    ![Test SSH ke VM Ubuntu 24](images/image-08.png)

### Langkah-langkah pengerjaan task Terraform

#### STEP 1 : Generate SSH key untuk login dengan SSH key pada vm

![Generate SSH key](images/image-09.png)

#### STEP 2 : Buat file `main.tf`, `providers.tf` dan `variables.tf` di dalam folder Terraform

**Note: file lengkapnya bisa dilihat di folder `./Automation/Terraform`**

- `main.tf`
  
  ![Isi file main.tf](images/image-10.png)
- `providers.tf`
  
  ![Isi file providers.tf](images/image-11.png)
- `variables.tf`
  
  ![Isi file variables.tf](images/image-12.png)

#### STEP 2 : Jalankan perintah `terraform plan` di dalam folder Terraform

![Output terraform plan](images/image-13.png)

#### STEP 3 : Jalankan perintah `terraform apply` di dalam folder Terraform

![Output terraform apply (1/3)](images/image-14.png)

![Output terraform apply (2/3)](images/image-15.png)

![Output terraform apply (3/3)](images/image-16.png)

#### STEP 4 : Cek apakah resource telah terbuat di microsoft azure

![Resource di Microsoft Azure (1/3)](images/image-17.png)

![Resource di Microsoft Azure (2/3)](images/image-18.png)

![Resource di Microsoft Azure (3/3)](images/image-19.png)

## [Ansible]

Buatlah ansible untuk :

- Membuat user baru, gunakan login ssh key & password
- Instalasi Docker
- Deploy application frontend yang sudah kalian gunakan sebelumnya menggunakan ansible.
- Instalasi Monitoring Server (node exporter, prometheus, grafana)
- Setup reverse-proxy
- Generated SSL certificate

### Langkah-langkah pengerjaan task Ansible

#### STEP 1 : Membuat file `ansible.cfg` untuk mengatur inventory, user SSH, dan private key

![Isi file ansible.cfg](images/image-20.png)

#### STEP 2 : Membuat file `inventory.ini` untuk list ip

![Isi file inventory.ini](images/image-21.png)

#### STEP 3 : Membuat file `task1-create-user.yml` untuk pembuatan user baru tiap vm

![Isi file task1-create-user.yml](images/image-22.png)

#### STEP 4 : Membuat file `task2-install-docker.yml` untuk menginstall docker di semua vm

![Isi file task2-install-docker.yml](images/image-23.png)

#### STEP 5 : Membuat file `task3-deploy-fe.yml` untuk deploy wayshub frontend ke vm linux debian

![Isi file task3-deploy-fe.yml (1/2)](images/image-24.png)

![Isi file task3-deploy-fe.yml (2/2)](images/image-25.png)

#### STEP 6 : Membuat file `task4-monitoring.yml`

![Isi file task4-monitoring.yml (1/2)](images/image-26.png)

![Isi file task4-monitoring.yml (2/2)](images/image-27.png)

#### STEP 7 : Membuat file `task5-ssl-certificate-wildcard.yml`

![Isi file task5-ssl-certificate-wildcard.yml (1/2)](images/image-28.png)

![Isi file task5-ssl-certificate-wildcard.yml (2/2)](images/image-29.png)

#### STEP 8 : Membuat file `task6-reverse-proxy.yml`

![Isi file task6-reverse-proxy.yml (1/2)](images/image-30.png)

![Isi file task6-reverse-proxy.yml (2/2)](images/image-31.png)

#### STEP 9 : Menjalankan file `task1-create-user.yml`

![Hasil menjalankan task1-create-user.yml](images/image-32.png)

#### STEP 10 : Menjalankan file `task2-install-docker.yml`

![Hasil menjalankan task2-install-docker.yml](images/image-33.png)

#### STEP 11 : Menjalankan file `task3-deploy-fe.yml`

![Hasil menjalankan task3-deploy-fe.yml](images/image-34.png)

#### STEP 12 : Menjalankan file `task4-monitoring.yml`

![Hasil menjalankan task4-monitoring.yml](images/image-35.png)

#### STEP 13 : Menjalankan file `task5-ssl-certificate-wildcard.yml`

![Hasil menjalankan task5-ssl-certificate-wildcard.yml](images/image-36.png)

#### STEP 14 : Menjalankan file `task6-reverse-proxy.yml`

![Hasil menjalankan task6-reverse-proxy.yml](images/image-37.png)

## [Monitoring Server]

- Setup node-exporter, prometheus dan Grafana menggunakan docker / native diperbolehkan
  
  - Node exporter
    
    ![Node exporter (1/2)](images/image-38.png)
    
    ![Node exporter (2/2)](images/image-39.png)
  - Prometheus
    
    ![Prometheus](images/image-40.png)
  - Grafana
    
    ![Grafana](images/image-41.png)
- monitoring seluruh server yang kalian buat di materi terraform dan yang kalian miliki di biznet.
  
  ![Monitoring seluruh server](images/image-42.png)
- Reverse Proxy
  
  - bebas ingin menggunakan nginx native / docker
    
    ![Reverse proxy dengan nginx native](images/image-43.png)
    
    Note: Menggunakan nginx native
- Domain
  
  - `exporter-$name.studentdumbways.my.id` (node exporter)
    
    ![Domain exporter (node exporter)](images/image-44.png)
  - `prom-$name.studentdumbways.my.id` (prometheus)
    
    ![Domain prom (prometheus)](images/image-45.png)
  - `monitoring-$name.studentdumbways.my.id` (grafana)
    
    ![Domain monitoring (grafana)](images/image-46.png)
- SSL Cloufflare on / certbot SSL biasa / wildcard SSL diperbolehkan
  
  - Hasil generate SSL Certificate Wildcard
    
    ![Hasil generate SSL Certificate Wildcard](images/image-47.png)
  - Konfigurasi reverse proxy sudah dengan SSL Certificate Wildcard
    
    ![Konfigurasi reverse proxy dengan SSL Certificate Wildcard (1/2)](images/image-48.png)
    
    ![Konfigurasi reverse proxy dengan SSL Certificate Wildcard (2/2)](images/image-49.png)
- Dengan Grafana, buatlah :
  
  - Dashboard untuk monitor resource server (CPU, RAM & Disk Usage) buatlah se freestyle kalian.
    
    ![Dashboard Grafana untuk monitor resource server](images/image-50.png)
  - Buat dokumentasi tentang rumus promql yang kalian gunakan
    
    - CPU Utilization
      
      ![PromQL CPU Utilization](images/image-51.png)
    - RAM Utilization Overview
      
      ![PromQL RAM Utilization Overview](images/image-52.png)
    - Specific RAM Utilization
      
      ![PromQL Specific RAM Utilization](images/image-53.png)
  - Buat alerting dengan Contact Point pilihan kalian (discord, telegram, slack dkk)
- Untuk alert :
  
  - Boleh menggunakan alert manager / alert rule dari grafana
  - Ketentuan alerting yang harus dibuat
    - CPU Usage over 20%
    - RAM Usage over 75%
  - Monitoring specific container
  - deploy application frontend di app-server (sudah dilakukan di task ansible)
  - monitoring frontend container
  - untuk alerting bisa di check di server discord yaa, sudah di buatkan channel alerting

### Langkah-langkah setup alert

#### STEP 1 : Buat channel untuk notifikasi dari grafana

![Channel notifikasi Discord](images/image-54.png)

#### STEP 2 : Buat webhook (isi nama dan channel), lalu copy url web hook

![Membuat webhook Discord](images/image-55.png)

#### STEP 3 : Buat contact point di grafana

![Contact point di Grafana](images/image-56.png)

#### STEP 4 : Buat notif policy

![Notification policy di Grafana](images/image-57.png)

#### STEP 5 : Buat alert rule untuk pengiriman notif monitoring server wayshub-frontend

![Alert rule wayshub-frontend (1/3)](images/image-58.png)

![Alert rule wayshub-frontend (2/3)](images/image-59.png)

![Alert rule wayshub-frontend (3/3)](images/image-60.png)

#### STEP 7 : Alert akan firing ketika kondisi terpenuhi

![Alert dalam status firing](images/image-61.png)

#### STEP 8 : Notif Masuk ke discord

![Notifikasi alert masuk ke Discord](images/image-62.png)

