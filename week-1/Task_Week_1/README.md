# TASK WEEK 1

LINK REPORT VIDEO : https://drive.google.com/file/d/1oLD5BGkYwtQH9huRZTFTdS2EAG61W5tx/view?usp=sharing

Sebelum mengerjakan tugas, mohon persiapkan :

- Akun Github dan buat repository dengan judul "devops21-dumbways-\<nama kalian\>"

- Gunakan file [<u>README.md</u>](http://readme.md/) untuk isi tugas kalian

- Buatlah langkah-langkah pengerjaan tugas beserta dokumentasinya

Requirment:

- Appserver for deploying Database

> Note: saya hanya menggunakan 1 server vm saja

- Gateway for deploying Frontend Application, Backend Application, And Web Server

> Note: saya hanya menggunakan 1 server vm saja

- Create new user for all of your server

> <img src="images/image52.png" style="width:4.79688in;height:2.44438in" />

- The server only can login with SSH-KEY without using password at all

> STEP 1 : Generate SSH Key
>
> <img src="images/image3.png" style="width:4.82813in;height:2.49469in" />
>
> STEP 2 : Tambahkan public ke ke file /.ssh/authorized_keys
>
> <img src="images/image18.png" style="width:4.93229in;height:2.51923in" />
>
> STEP 3 : Atur konfigurasi dengan ubah jadi comment dengan menambahkan pagar di
>
> “Include /etc/ssh/sshd_config/d/\*.conf” pada file /etc/ssh/sshd_config
>
> <img src="images/image38.png" style="width:4.96354in;height:2.54487in" />
>
> STEP 4 : Atur konfigurasi dengan menghilangkan pagar dan set PasswordAuthentication
>
> jadi “no” pada file /etc/ssh/sshd_config
>
> <img src="images/image10.png" style="width:4.93631in;height:2.50095in" />
>
> STEP 5 : restart aplikasi SSH
>
> <img src="images/image13.png" style="width:4.96354in;height:2.54163in" />

STEP 6 : Kemudian exit dari remote server

<img src="images/image22.png" style="width:4.96354in;height:2.53326in" />

STEP 7 : Test apakah masih bisa pakai password

<img src="images/image42.png" style="width:4.95313in;height:2.50581in" />

- Deploy database MySQL

> <img src="images/image23.png" style="width:4.63675in;height:2.37833in" />
>
> <img src="images/image7.png" style="width:4.65104in;height:2.38125in" />

- Setup secure_installation

<img src="images/image47.png" style="width:4.38442in;height:4.06771in" />

- Add password for root user

> <img src="images/image48.png" style="width:4.85938in;height:2.73642in" />

- Create new user for MySQL

> <img src="images/image43.png" style="width:4.90104in;height:2.50751in" />

- Create new database

> <img src="images/image55.png" style="width:4.89063in;height:2.50696in" />

- Create privileges for your new user so they can access the database you created

> <img src="images/image29.png" style="width:5.19271in;height:2.65233in" />

- Dont forget to change the MySQL bind address on /etc/mysql/mysql.conf.d/mysqld.cnf

> <img src="images/image27.png" style="width:5.21354in;height:2.66739in" />

- Role Based

  - Create new database call demo and make some dummy table call transaction

> <img src="images/image17.png" style="width:5.21354in;height:2.66739in" />

- Create a 2 role with the name admin, and guest that will be used to see and manage the 'transaction' table.

> <img src="images/image24.png" style="width:4.75521in;height:2.4092in" />

- Give SELECT, INSERT, UPDATE, and DELETE access rights to the transaction table for the admin role you just created. and only give SELECT access to guest.

> <img src="images/image16.png" style="width:4.89063in;height:2.20972in" />

- Create a new user with the username your_name and password your_password. Add the user to the admin role.

> <img src="images/image32.png" style="width:4.98438in;height:2.49219in" />

- Create a new user with the username guest and password guest. Add the user to the guest role.

> <img src="images/image40.png" style="width:5.21354in;height:2.60677in" />

- Test all of your user

> <img src="images/image36.png" style="width:5.22396in;height:2.62933in" />
>
> <img src="images/image45.png" style="width:5.2156in;height:2.56657in" />

- Remote User

  - Try to remote your database from your local computer with mysql-client

> <img src="images/image6.png" style="width:5.31771in;height:3.02986in" />

- Deploy Wayshub-Backend

  - Clone wayshub backend application

> <img src="images/image4.png" style="width:4.81771in;height:2.38958in" />

- Use Node Version 14

> <img src="images/image21.png" style="width:4.77604in;height:2.68406in" />

- Dont forget to change configuration on dumbflix-backend/config/config.json and then adjust it to your database.

> <img src="images/image53.png" style="width:5.17188in;height:2.9124in" />

- Install sequelize-cli

> <img src="images/image41.png" style="width:5.16146in;height:2.57216in" />

- Running migration

> <img src="images/image26.png" style="width:5.21354in;height:2.60677in" />

- Deploy apllication on Top PM2

> STEP 1 : Install dependency aplikasi wayshub backend
>
> <img src="images/image25.png" style="width:4.78646in;height:2.69698in" />
>
> STEP 2 : Install PM2
>
> <img src="images/image50.png" style="width:4.80729in;height:2.7071in" />
>
> STEP 3 : Generate file ecosystem.config.js
>
> <img src="images/image5.png" style="width:4.79688in;height:2.3586in" />
>
> STEP 4 : Hapus service-worker pada script dan match di file ecosystem.config.js
>
> <img src="images/image9.png" style="width:4.60938in;height:2.38833in" />
>
> STEP 5 : Jalankan aplikasi backend dengan PM2
>
> <img src="images/image46.png" style="width:4.51563in;height:2.53644in" />
>
> STEP 6 : Cek apakah aplikasi sudah berjalan di browser
>
> <img src="images/image14.png" style="width:4.50521in;height:2.53699in" />
>
> STEP 7 : Install nginx pada server
>
> <img src="images/image15.png" style="width:4.79688in;height:2.47398in" />
>
> STEP 8 : Tambahkan file wayshub.conf pada directory /etc/nginx/sites-enabled
>
> yang berisi :
>
> <img src="images/image35.png" style="width:4.78646in;height:2.29782in" />
>
> STEP 9 : Test apakah file wayshub.conf sudah benar
>
> <img src="images/image34.png" style="width:4.85938in;height:2.33282in" />
>
> STEP 10 : Restart nginx
>
> <img src="images/image57.png" style="width:4.85938in;height:2.34903in" />
>
> STEP 11 : Daftarkan domain di cloudflare
>
> <img src="images/image12.png" style="width:4.82813in;height:2.71883in" />
>
> STEP 12: Tunggu sampai domain terdaftar, lalu cek apakah backend sudah bisa
>
> diakses melalui domain di browser
>
> <img src="images/image51.png" style="width:4.79688in;height:2.69761in" />
>
> STEP 13 : Pasang certificate SSL dengan certbot agar menggunakan https
>
> <img src="images/image39.png" style="width:4.63021in;height:4.20718in" />
>
> STEP 14 : Cek apakah backend kita sudah menggunakan https
>
> <img src="images/image11.png" style="width:4.65104in;height:2.61911in" />

- Clone Wayshub-Frontend application

> <img src="images/image56.png" style="width:5.17188in;height:2.64608in" />

- Use Node Version 14

> <img src="images/image21.png" style="width:4.77604in;height:2.68406in" />

- Dont forget to change configuration on src/config/api.js and then adjust it to backend url.

> <img src="images/image44.png" style="width:4.78646in;height:2.44889in" />

- Deploy frontend apllication on Top PM2

> STEP 1 : Install dependency wayshub-frontend
>
> <img src="images/image37.png" style="width:5.03646in;height:2.58516in" />
>
> STEP 2 : Generate file [<u>ecosystem.config.js</u>](http://ecosystem.config.js)
>
> <img src="images/image30.png" style="width:5.08201in;height:2.57199in" />
>
> STEP 3 : Hapus service worker pada file [<u>ecosystem.config.js</u>](http://ecosystem.config.js) dan ganti “npm
>
> start” dari yang sebelumnya “index.js”
>
> <img src="images/image19.png" style="width:5.06771in;height:2.59442in" />
>
> STEP 4 : Jalankan aplikasi frontend dengan PM2
>
> <img src="images/image49.png" style="width:4.83854in;height:2.71891in" />
>
> STEP 5 : Cek di browser apakah sudah berjalan
>
> <img src="images/image31.png" style="width:4.78646in;height:2.69536in" />
>
> STEP 6 : Tambahkan config nginx di file /etc/nginx/sites-enabled/wayshub.conf
>
> <img src="images/image2.png" style="width:5.00521in;height:1.36506in" />
>
> STEP 7 : Test file wayshub.conf sudah benar
>
> <img src="images/image28.png" style="width:5.04688in;height:2.57374in" />
>
> STEP 8 : Restart nginx agar config dimasukan ke nginx
>
> <img src="images/image20.png" style="width:5.05729in;height:2.56225in" />
>
> STEP 9 : Daftarkan domain di cloudflare agar bisa diakses melalui domain
>
> <img src="images/image54.png" style="width:5.08854in;height:2.86547in" />
>
> STEP 10 : Cek apakah website sudah bisa diakses melalui domain
>
> <img src="images/image1.png" style="width:5.09896in;height:2.86435in" />
>
> STEP 11 : Pasang SSL certificate certbot agar wayshub frontend menggunakan
>
> https
>
> <img src="images/image8.png" style="width:5.17188in;height:2.64139in" />
>
> STEP 12 : Akses wayshub frontend menggunakan https menggunakan browser
>
> <img src="images/image33.png" style="width:5.21354in;height:2.92492in" />
