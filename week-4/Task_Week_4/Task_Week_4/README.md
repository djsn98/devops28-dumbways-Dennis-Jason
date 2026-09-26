# Task Week 4

## 1. Buatlah sebuah kubernetes cluster, yang di dalamnya terdapat 3 buah node as a master and worker.

STEP 1 : Siapkan 3 buah vm

![](./images/image7.png)

STEP 2 : Buat security rule untuk mengizinkan akses masuk ke port 6443

![](./images/image14.png)

STEP 3 : Install K3S server di VM pertama

![](./images/image25.png)

STEP 4 : Verifikasi apakah instalasi K3S server di VM pertama berhasil

![](./images/image29.png)

STEP 5 : Salin token yang digunakan sebagai sandi untuk menghubungkan node worker ke node master

![](./images/image19.png)

STEP 6 : Install K3S di vm kedua dan menghubungkan ke vm pertama

![](./images/image11.png)

STEP 7 : Install K3S di vm ketiga dan menghubungkan ke vm pertama

![](./images/image16.png)

STEP 8 : Masuk ke vm pertama, verifikasi apakah semua node sudah berhasil terhubung

![](./images/image24.png)

## 2. Install ingress nginx using helm or manifest

STEP 1 : Menghapus manifes Traefik agar K3s tidak menerapkannya kembali saat *restart*

![](./images/image22.png)

STEP 2 : Uninstal *resource* Helm CRD yang dikelola untuk Traefik

![](./images/image15.png)

STEP 3 : Menginstall helm agar berjalan di terminal

![](./images/image32.png)

STEP 4 : Menambahkan repositori resmi ingress-nginx Kubernetes ke Helm dan kemudian memperbarui indeks *chart* lokal

![](./images/image27.png)

STEP 5 : Menyalin konfigurasi K3s ke user azureuser agar file konfigurasi kubernetes bisa

diakses oleh aplikasi Helm dan juga diberikan akses permanen

![](./images/image13.png)

STEP 6 : Menginstal nginx Ingress Controller

![](./images/image21.png)

STEP 7 : Mengecek apakah *pod* controller sudah berjalan dan Service

ingress-nginx-controller menerima IP eksternal dari ServiceLB bawaan K3s

![](./images/image12.png)

## 3. Deploy aplikasi yang kalian gunakan ke dalam kubernetes cluster yang telah kalian buat di point nomer 1.

> STEP 1 : Buat file yaml yang berisi statefulset dan service cluster ip untuk deploy
>
> database

![](./images/image34.png)

![](./images/image33.png)

STEP 2 : Apply file yaml database ke dalam K3S

![](./images/image28.png)

STEP 3 : Buat file yaml yang berisi deployment dan service untuk backend

> ![](./images/image30.png)
> 
> ![](./images/image36.png)
> 
> STEP 4 : Apply file yaml backend ke dalam K3S
> 
> ![](./images/image26.png)
> 
> STEP 5 : Buat file yaml yang berisi deployment dan service untuk deploy frontend
> 
> ![](./images/image31.png)
> 
> STEP 6 : Apply file yaml frontend ke dalam K3S
> 
> ![](./images/image37.png)
> 
> STEP 7 : Buat file yaml yang berisi ingress untuk mengakses fe dan be dengan
> 
> domain
> 
> ![](./images/image23.png)
> 
> STEP 8 : Apply file yaml Ingress ke dalam K3S
> 
> ![](./images/image35.png)
> 
> STEP 7 : Cek di cluster K3S apakah semua object sudah terbuat dan berjalan
> 
> ![](./images/image2.png)

![](./images/image10.png)

STEP 8 : Cek di browser apakah aplikasi sudah berjalan

> ![](./images/image9.png)

![](./images/image6.png)

## 4. Setup persistent volume untuk database kalian

![](./images/image4.png)

![](./images/image20.png)

## 5. Deploy database mysql with statefullset and use secrets

![](./images/image17.png)

![](./images/image18.png)

![](./images/image8.png)

## 6. Install cert-manager ke kubernetes cluster kalian, lalu buat lah wildcard ssl certificate.

## 7. Ingress

![](./images/image5.png)

- fe : [name.kubernetes.studentdumbways.my.id](http://name.kubernetes.studentdumbways.my.id/)

> ![](./images/image1.png)

- be : [be-name.kubernetes.studentdumbways.my.id](http://api.name.kubernetes.studentdumbways.my.id/)

> ![](./images/image3.png)

