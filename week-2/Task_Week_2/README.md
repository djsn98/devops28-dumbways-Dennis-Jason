# Task Week 2 — Docker, Jenkins & Gitlab CI/CD

LINK REPORT VIDEO :
https://drive.google.com/file/d/1MXCbD1fI5EkUQVr_W5VPGTDDvXgiIgQM/view?usp=sharing

Dokumentasi pengerjaan tugas deployment aplikasi (Wayshub Frontend & Backend) menggunakan Docker, Jenkins, dan Gitlab/GitHub Actions.

## Docker

- Buatlah suatu user baru dengan nama kalian.

1. Jenkins Server

![Screenshot langkah](images/image1.png)

2. Builder Server

![Screenshot langkah](images/image76.png)

3. App Server

![Screenshot langkah](images/image11.png)

- Buatlah bash script se freestyle mungkin untuk melakukan installasi docker.

![Screenshot langkah](images/image48.png)

- Deploy aplikasi Web Server, Frontend, Backend, serta Database on top docker compose
- Ketentuan pengerjaan:
- Deploy database di server terpisah (Menggunak)
- Server Backend terpisah
- Server Frontend terpisah
- Web Server juga terpisah untuk reverse proxy kalian nantinya.
- Untuk penamaan image, sesuaikan dengan environment masing masing, ex: mentor/dumbflx-frontend:production
- Di dalam docker-compose file buat suatu custom network dengan nama team kalian, lalu pasang ke setiap service yang kalian miliki.
- Deploy database terlebih dahulu menggunakan mysql dan jangan lupa untuk pasang volume di bagian database.
- Untuk building image frontend dan backend sebisa mungkin buat dockerized dengan image sekecil mungkin(gunakan multistage build). dan jangan lupa untuk sesuaikan configuration dari backend ke database maupun frontend ke backend sebelum di build menjadi docker images.
- Untuk Web Server buatlah configurasi reverse-proxy menggunakan nginx on top docker.
- SSL CLOUDFLARE OFF!!!
- Gunakan docker volume untuk membuat reverse proxy
- SSL gunakan wildcard
- Untuk DNS bisa sesuaikan seperti contoh di bawah ini
- Frontend: [mentor.studentdumbways.my.id](http://team1.studentdumbways.my.id/)
- Backend: [api.mentor.studentdumbways.my.id](http://api.team1.studentdumbways.my.id/)
- Push image ke docker registry kalian masing-masing.
- Aplikasi dapat berjalan dengan sesuai seperti melakukan login/register.

### Tahap 1: Deploy backend dan database

**Langkah 1:** Git clone repo backend

![Screenshot langkah](images/image46.png)

**Langkah 2:** Sesuaikan config/config.json di dalam folder wayshub-backend, arahkan ke database yang akan di-run dalam container.

**Note: pada bagian host isi dengan nama service di docker compose**

![Screenshot langkah](images/image71.png)

**Langkah 3:** Buat file Dockerfile

![Screenshot langkah](images/image20.png)

**Langkah 4:** Build docker image

![Screenshot langkah](images/image83.png)

**Langkah 5:** Push docker image ke docker hub

![Screenshot langkah](images/image4.png)

**Langkah 6:** Cek apakah image sudah masuk

![Screenshot langkah](images/image37.png)

**Langkah 7:** Buat docker compose file yang berisi deployment backend dan database

![Screenshot langkah](images/image91.png)

**Langkah 8:** Jalankan docker compose filenya

![Screenshot langkah](images/image94.png)

**Langkah 9:** Cek di docker apakah sudah berjalan

![Screenshot langkah](images/image75.png)

**Langkah 10:** Cek log wayshub backend dan database apakah sudah benar

- backend

![Screenshot langkah](images/image51.png)

- database

![Screenshot langkah](images/image32.png)

**Langkah 11:** Cek di browser apakah sudah berjalan backendnya

![Screenshot langkah](images/image19.png)

### Tahap 2: Deploy frontend

**Langkah 1:** Git clone wayshub frontend

![Screenshot langkah](images/image47.png)

**Langkah 2:** Ubah endpoint backend pada file src/config/[api.js](http://api.js) dengan domain backend

![Screenshot langkah](images/image10.png)

**Langkah 3:** Buat Dockerfile

![Screenshot langkah](images/image79.png)

**Langkah 4:** Build docker image

![Screenshot langkah](images/image80.png)

**Langkah 5:** Push docker image ke docker hub

![Screenshot langkah](images/image21.png)

**Langkah 6:** Cek apakah image sudah masuk ke docker hub

![Screenshot langkah](images/image61.png)

**Langkah 7:** setup aplikasi certbot untuk menerbitkan sertifikat ssl

![Screenshot langkah](images/image101.png)

**Langkah 8:** Terbitkan sertifikat ssl

![Screenshot langkah](images/image29.png)

**Langkah 9:** Tambahkan record di DNS provider (dilakukan saat menerbitkan sertifikat ssl)

![Screenshot langkah](images/image3.png)

**Langkah 10:** Pada folder project buat file nginx-conf/reverse-proxy.conf

![Screenshot langkah](images/image66.png)

![Screenshot langkah](images/image23.png)

**Langkah 11:** Buat docker compose file yang berisi deployment frontend dan nginx

![Screenshot langkah](images/image60.png)

**Langkah 12:** Jalankan docker compose file

![Screenshot langkah](images/image52.png)

**Langkah 13:** Cek apakah container sudah berjalan di docker

![Screenshot langkah](images/image17.png)

**Langkah 14:** Cek apakah log sudah benar

- nginx

![Screenshot langkah](images/image13.png)

- wayshub frontend

![Screenshot langkah](images/image55.png)

**Langkah 15:** Cek di browser apakah sudah jalan

![Screenshot langkah](images/image95.png)

### Tahap 3: Memasang domain di cloudflare untuk backend dan frontend

**Langkah 1:** Buat record baru untuk sub domain

![Screenshot langkah](images/image86.png)

![Screenshot langkah](images/image30.png)

**Langkah 2:** Akses backend dan frontend via domain

![Screenshot langkah](images/image14.png)

![Screenshot langkah](images/image53.png)

### Tahap 4: Testing

**Langkah 1:** Test register

![Screenshot langkah](images/image99.png)

**Langkah 2:** Tes login

![Screenshot langkah](images/image57.png)

## Jenkins

- Installasi Jenkins on top Docker or native

**Langkah 1:** lakukan instalasi dengan perintah docker run

![Screenshot langkah](images/image6.png)

**Langkah 2:** Cek apakah sudah berjalan di dalam docker

![Screenshot langkah](images/image100.png)

**Langkah 3:** Masukan password yang ada di log

![Screenshot langkah](images/image63.png)

![Screenshot langkah](images/image92.png)

**Langkah 4:** Pilih select plugins to install untuk memilih plugin apa saja yang ingin diinstall

![Screenshot langkah](images/image67.png)

**Langkah 5:** centang plugin SSH Agent agar bisa melakukan SSH, kemudian klik install

![Screenshot langkah](images/image25.png)

**Langkah 6:** Tunggu proses instalasi sampai selesai

![Screenshot langkah](images/image78.png)

**Langkah 7:** Buat user baru dan klik save and continue

![Screenshot langkah](images/image68.png)

**Langkah 8:** Biarkan default isi jenkins url. Lalu klik save and finish

![Screenshot langkah](images/image24.png)

**Langkah 9:** Klik Start using Jenkins dan akan tampil dashboard jenkins

![Screenshot langkah](images/image22.png)

![Screenshot langkah](images/image8.png)

- Setup SSH-KEY di local server jenkins kalian, agar dapat login ke dalam server menggunakan SSH-KEY

**Langkah 1:** Klik manage jenkins (roda gigi)

![Screenshot langkah](images/image69.png)

**Langkah 2:** Masuk ke menu security

![Screenshot langkah](images/image44.png)

**Langkah 3:** Pada host key verification strategy pilih "Accept first connection" agar ketika SSH berhasil karena auto generate known_hosts file, lalu klik save

![Screenshot langkah](images/image96.png)

**Langkah 4:** Pada manage jenkins pilih menu credentials

![Screenshot langkah](images/image88.png)

**Langkah 5:** Klik system pada stores scoped to jenkins

![Screenshot langkah](images/image49.png)

**Langkah 6:** Klik Global pada System

![Screenshot langkah](images/image43.png)

**Langkah 7:** Klik button Add Credentials

![Screenshot langkah](images/image50.png)

**Langkah 8:** Pilih type of credential "SSH Username with private key", lalu klik next

![Screenshot langkah](images/image9.png)

**Langkah 9:** Isi pada bagian ID, Username dan centang radio button "Enter directly" dan masukan private key. Kemudian klik create dan SSH-KEY sudah ada di dalam jenkins

**Note: isi private key dari server yang akan di SSH jenkins**

![Screenshot langkah](images/image26.png)

![Screenshot langkah](images/image45.png)

- Reverse Proxy Jenkins
- gunakan domain ex. [jenkins.mentor.studentdumbways.my.id](http://jenkins.team1.studentdumbways.my.id/)
- reverse proxy sesuaikan dengan ketentuan yang ada di dalam Jenkins documentation

**Langkah 1:** Tambahkan konfigurasi pada file reverse proxy pada jenkins yang berjalan di docker

![Screenshot langkah](images/image41.png)

**Langkah 2:** Lakukan restart nginx dengan docker compose

![Screenshot langkah](images/image103.png)

**Langkah 3:** Akses jenkins dengan domain di browser

![Screenshot langkah](images/image65.png)

- Buatlah beberapa Job untuk aplikasi kalian yang telah kalian deploy di task sebelumnya (frontend && backend)
- Untuk script CICD atur flow pengupdate an aplikasi se freestyle kalian dan harus mencangkup
- Pull dari repository
- Dockerize/Build aplikasi kita
- Test application
- Push ke Docker Hub
- Deploy aplikasi on top Docker
- Auto trigger setiap ada perubahan di SCM
- Buat job notification ke discord

### Tahap 1: Siapkan Jenkinsfile

**Langkah 1:** Buat Jenkinsfile wayshub frontend

![Screenshot langkah](images/image39.png)

**Langkah 2:** Buat Jenkinsfile wayshub frontend

![Screenshot langkah](images/image15.png)

### Tahap 2: Buat pipeline untuk wayshub frontend dan wayshub backend

**Langkah 1:** Klik new item dan pilih pipeline dan masukan nama pipeline lalu klik ok

![Screenshot langkah](images/image87.png)

**Langkah 2:** Centang "Github hook trigger for GITScm polling" pada bagian Triggers

![Screenshot langkah](images/image98.png)

**Langkah 3:** isi bagian pipeline, lalu klik save

![Screenshot langkah](images/image28.png)

**Langkah 4:** Ulangi STEP 1 sampai STEP 3 sesuaikan isinya dengan wayshub backend

**Langkah 5:** Tambahkan secret melalui halaman "Manage Jenkins > Credential > System > Global" dengan klik button "Add Credentials"

![Screenshot langkah](images/image33.png)

**Langkah 6:** Pilih secret text, lalu next

![Screenshot langkah](images/image77.png)

**Langkah 7:** Lalu isi di kolom Secret dan ID

![Screenshot langkah](images/image102.png)

**Langkah 8:** Buat 3 secret berikut :

![Screenshot langkah](images/image81.png)

**Langkah 9:** Melalui halaman Manage Jenkins > System, tambahkan env variable

![Screenshot langkah](images/image97.png)

**Langkah 10:** Test dengan trigger manual dengan klik "Build Now"

![Screenshot langkah](images/image56.png)

**Langkah 11:** Cek di console output apakah pipeline berjalan sampai sukses

![Screenshot langkah](images/image42.png)

**Langkah 12:** Ulangi STEP 10 sampai STEP 11 untuk yang wayshub backend

**Langkah 13:** Tambahkan Webhook di masing - masing repo github wayshub frontend dan backend. Pada repo klik tab Settings, lalu klik menu Webhooks di sebelah kiri, kemudian klik button "Add webhook". Lalu ada autentikasi dengan passcode melalui email. Setelah itu isi masing-masing sesuai di bawah ini :

**Note: pemasangan web hook bertujuan jiak ada perubahan kode di github akan**

**men-trigger pipeline**

- Wayshub Frontend

![Screenshot langkah](images/image85.png)

- Wayshub Backend

![Screenshot langkah](images/image58.png)

**Langkah 14:** Masuk ke server discord lalu buat text channel untuk menerima notifikasi pipeline deployment

![Screenshot langkah](images/image72.png)

**Langkah 15:** Klik kanan pada server lalu pilih Server Settings lalu pilih integrations

![Screenshot langkah](images/image40.png)

**Langkah 16:** Klik Webhooks

![Screenshot langkah](images/image31.png)

**Langkah 17:** Buat webhooks baru dengan klik button "New Webhook", lalu isi name dan channel yang diinginkan. Kemudian klik "Copy Webhook URL"

![Screenshot langkah](images/image73.png)

**Langkah 18:** Buat webhook URL yang kita copy menjadi secret text melalui Manage Jenkins > Credentials > System > Global, lalu klik button "Add Credentials"

![Screenshot langkah](images/image36.png)

**Langkah 19:** Pilih secret text lalu next

![Screenshot langkah](images/image18.png)

**Langkah 20:** Paste Webhook URL ke kolom secret dan berikan ID, lalu klik "Create"

![Screenshot langkah](images/image62.png)

**Langkah 21:** Tes apakah pipeline mengirim notifikasi ke discord

![Screenshot langkah](images/image12.png)

![Screenshot langkah](images/image54.png)

![Screenshot langkah](images/image104.png)

## Gitlab

- Implementasikan penggunaan Gitlab Runner pada aplikasi Frontend Kalian
- Buatlah beberapa Job untuk aplikasi kalian yang telah kalian deploy di task sebelumnya (frontend && backend)
- Untuk script CICD atur flow pengupdate an aplikasi se freestyle kalian dan harus mencangkup
- Pull dari repository
- Dockerize/Build aplikasi kita
- Test application
- Push ke Docker Hub
- Deploy aplikasi on top Docker
- Auto trigger setiap ada perubahan di SCM
- Buat job notification ke discord

**Langkah 1:** Ke repo wayshub frontend lalu klik tab "Actions"

![Screenshot langkah](images/image90.png)

**Langkah 2:** Pilih template yang Docker Image

![Screenshot langkah](images/image64.png)

**Langkah 3:** Edit template menjadi

![Screenshot langkah](images/image5.png)

![Screenshot langkah](images/image74.png)

![Screenshot langkah](images/image35.png)

**Langkah 4:** Siapkan credential docker token untuk diset di github action secret

![Screenshot langkah](images/image105.png)

![Screenshot langkah](images/image34.png)

**Langkah 5:** Buat text channel di discord untuk tempat notifikasi

![Screenshot langkah](images/image89.png)

**Langkah 6:** Buat webhook dan copy webhook URL untuk di set di github action

![Screenshot langkah](images/image16.png)

**Langkah 7:** Set variable dan secret di github action

1. Ke repo wayshub frontend lalu klik tab Settings dan pilih menu di sebelah kiri drop down menu "Secrets and variables", lalu klik "Actions"

![Screenshot langkah](images/image38.png)

2. Buat environment untuk mengelompokan secret dan variable

![Screenshot langkah](images/image93.png)

![Screenshot langkah](images/image82.png)

![Screenshot langkah](images/image27.png)

3. Tambahkan variable dan secret yang diperlukan

![Screenshot langkah](images/image2.png)

**Langkah 8:** Tes github action apakah berjalan jika ada push

![Screenshot langkah](images/image59.png)

![Screenshot langkah](images/image70.png)

**Langkah 9:** Pastikan deployment berhasil

![Screenshot langkah](images/image84.png)

**Langkah 10:** Pastikan juga mengirim notifikasi ke discord

![Screenshot langkah](images/image7.png)

