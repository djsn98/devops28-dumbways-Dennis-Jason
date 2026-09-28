# TASK WEEK 4

LINK REPORT VIDEO : https://drive.google.com/file/d/1e8QHJPJACJR4Q-ZmRl7FZe8Q8wVGRODy/view?usp=sharing

## 1. Buatlah sebuah kubernetes cluster, yang di dalamnya terdapat 3 buah node as a master and worker.

**STEP 1 :** Siapkan 3 buah VM

![Tiga VM yang telah disiapkan](images/image-01.png)

**STEP 2 :** Buat security rule untuk mengizinkan akses masuk ke port 6443

![Security rule untuk port 6443](images/image-02.png)

**STEP 3 :** Install K3S server di VM pertama

![Instalasi K3S server di VM pertama](images/image-03.png)

**STEP 4 :** Verifikasi apakah instalasi K3S server di VM pertama berhasil

![Verifikasi instalasi K3S server](images/image-04.png)

**STEP 5 :** Salin token yang digunakan sebagai sandi untuk menghubungkan node worker ke node master

![Token K3S dari node master](images/image-05.png)

**STEP 6 :** Install K3S di VM kedua dan menghubungkan ke VM pertama

![Instalasi K3S di VM kedua](images/image-06.png)

**STEP 7 :** Install K3S di VM ketiga dan menghubungkan ke VM pertama

![Instalasi K3S di VM ketiga](images/image-07.png)

**STEP 8 :** Masuk ke VM pertama, verifikasi apakah semua node sudah berhasil terhubung

![Verifikasi semua node terhubung](images/image-08.png)

## 2. Install ingress nginx using helm or manifest

**STEP 1 :** Menghapus manifes Traefik agar K3s tidak menerapkannya kembali saat *restart*

![Menghapus manifes Traefik](images/image-09.png)

**STEP 2 :** Uninstal *resource* Helm CRD yang dikelola untuk Traefik

![Uninstal resource Helm CRD Traefik](images/image-10.png)

**STEP 3 :** Menginstall Helm agar berjalan di terminal

![Instalasi Helm](images/image-11.png)

**STEP 4 :** Menambahkan repositori resmi ingress-nginx Kubernetes ke Helm dan kemudian memperbarui indeks *chart* lokal

![Menambahkan repositori ingress-nginx dan update chart](images/image-12.png)

**STEP 5 :** Menyalin konfigurasi K3s ke user azureuser agar file konfigurasi kubernetes bisa diakses oleh aplikasi Helm dan juga diberikan akses permanen

![Menyalin konfigurasi K3s ke user azureuser](images/image-13.png)

**STEP 6 :** Menginstal nginx Ingress Controller

![Instalasi nginx Ingress Controller](images/image-14.png)

**STEP 7 :** Mengecek apakah *pod* controller sudah berjalan dan Service ingress-nginx-controller menerima IP eksternal dari ServiceLB bawaan K3s

![Pod dan Service ingress-nginx-controller](images/image-15.png)

## 3. Deploy aplikasi yang kalian gunakan ke dalam kubernetes cluster yang telah kalian buat di point nomer 1.

**STEP 1 :** Buat file yaml yang berisi statefulset dan service cluster ip untuk deploy database

![File yaml database: ConfigMap, Secret, PersistentVolume, dan StatefulSet (bagian 1)](images/image-16.png)

![File yaml database: lanjutan StatefulSet dan Service (bagian 2)](images/image-17.png)

**STEP 2 :** Apply file yaml database ke dalam K3S

![Apply file yaml database](images/image-18.png)

**STEP 3 :** Buat file yaml yang berisi deployment dan service untuk backend

![Screenshot file yaml pada step ini (bagian 1)](images/image-19.png)

![Screenshot file yaml pada step ini (bagian 2)](images/image-20.png)

**STEP 4 :** Apply file yaml backend ke dalam K3S

![Apply file yaml backend](images/image-21.png)

**STEP 5 :** Buat file yaml yang berisi deployment dan service untuk deploy frontend

![File yaml Deployment dan Service frontend](images/image-22.png)

**STEP 6 :** Apply file yaml frontend ke dalam K3S

![Apply file yaml frontend](images/image-23.png)

**STEP 7 :** Buat file yaml yang berisi ingress untuk mengakses fe dan be dengan domain

![File yaml Ingress](images/image-24.png)

**STEP 8 :** Apply file yaml Ingress ke dalam K3S

![Apply file yaml Ingress](images/image-25.png)

**STEP 7 :** Cek di cluster K3S apakah semua object sudah terbuat dan berjalan

![Pengecekan object di cluster K3S (bagian 1)](images/image-26.png)

![Pengecekan object di cluster K3S (bagian 2)](images/image-27.png)

**STEP 8 :** Cek di browser apakah aplikasi sudah berjalan

![Aplikasi berjalan di browser (bagian 1)](images/image-28.png)

![Aplikasi berjalan di browser (bagian 2)](images/image-29.png)

## 4. Setup persistent volume untuk database kalian

![Setup persistent volume (bagian 1)](images/image-30.png)

![Setup persistent volume (bagian 2)](images/image-31.png)

## 5. Deploy database mysql with statefullset and use secrets

![Deploy MySQL dengan StatefulSet dan Secrets (bagian 1)](images/image-32.png)

![Deploy MySQL dengan StatefulSet dan Secrets (bagian 2)](images/image-33.png)

![Deploy MySQL dengan StatefulSet dan Secrets (bagian 3)](images/image-34.png)

## 6. Install cert-manager ke kubernetes cluster kalian, lalu buat lah wildcard ssl certificate.

**STEP 1 :** Install cert manager

![Instalasi cert-manager](images/image-35.png)

**STEP 2 :** Verifikasi apakah pod cert manager sudah berjalan

![Verifikasi pod cert-manager](images/image-36.png)

**STEP 3 :** Membuat file yaml untuk membuat object cluster issuer

![File yaml ClusterIssuer](images/image-37.png)

**STEP 4 :** Membuat object cluster issuer dengan perintah kubectl

![Membuat ClusterIssuer dengan kubectl](images/image-38.png)

**STEP 5 :** Menambahkan anotasi dan list hostname serta secret pada yaml pembuatan object ingress agar cert manager menerbitkan sertifikat SSL untuk list hostname dan meletakan sertifikat pada secret

![File yaml Ingress dengan anotasi cert-manager](images/image-39.png)

**STEP 6 :** Lakukan perubahan object ingress dengan perintah kubectl

![Apply perubahan object Ingress](images/image-40.png)

**STEP 7 :** Pastikan status READY pada sertifikat sudah true

![Status READY sertifikat](images/image-41.png)

**STEP 8 :** Pastikan di browser sertifikat sudah ada

![Sertifikat SSL di browser (bagian 1)](images/image-42.png)

![Sertifikat SSL di browser (bagian 2)](images/image-43.png)

## 7. Ingress

![Konfigurasi Ingress](images/image-44.png)

- fe : [name.kubernetes.studentdumbways.my.id](http://name.kubernetes.studentdumbways.my.id/)
  
  ![Tampilan frontend](images/image-45.png)
- be : [be-name.kubernetes.studentdumbways.my.id](http://api.name.kubernetes.studentdumbways.my.id/)
  
  ![Tampilan backend](images/image-46.png)

