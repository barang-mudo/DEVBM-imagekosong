Didalam container sudah terdapat konfigurasi PHP dengan lengkap yang dapat anda fungiskan dalam menjalankan PHP-Framework *Codeigniter Versi. 3.11*
pada container ini saya sudah merapikan semua bug yang saya temui saya temui saat deployment Ci3 diantaranya:

- Masalah saaat menggunakan beberapa library yang dibutuhkan seperti *php_mysqli* 
   .. pada image ini sudah saya selesaikan 
- Masalah seperti sessions.save_path eror
   .. Pada image ini sudah saya lampirkan di dlaam dockerfiles untuk _configure php.ini_ agar secara automation/dynamis mengaktifkan konfigurasi sessions.save_path menuju folder default _/temp_ di kernel container, perintah pada docker files tersebut seperti berikut:
- Masalah pada saat konfigurasi database agar otomatis membawa hasil backupan sqldump dari phpmyadmin /  mysqlYoq engan melampirkan pada sebuah folder lalu tuliskan pada baris Service YML file *mariaDB* dengan fungsi:   *volumes:*

##### Auto Import SQL Dump files (.sql)

    volumes:
        - ./db_sqldata/db_bm.sql:/docker-entrypoint-initdb.d/dump.sql



##### Sessions path configures di dalam dockerfile
    RUN echo "session.save_path=\"/tmp\"" >> /opt/bitnami/php/lib/php.ini

atau kamu dapatkan menuliskannya pada terminal kernel container dengan cara masuk melalui perintah *docker exec -it <idcontainer> bash* lalu tulis perintah seperti berikut:

##### Perintah pada terminal 

    # echo "session.save_path=\"/tmp\"" >> /opt/bitnami/php/lib/php.ini


# How to RUN this Images

1. Pull reqquest WEB Images from my repo with command
    
    docker pull ranur/codeigniter:3.11-sessions
 
2. Pull reqquest DATABASE Images from my repo  with command

    docker pull ranur/mariadb:10.3-mudo

3. Pull request phpmyadmin Images from my repo with command

    docker pull ranur/phpmyadmin:1.1-links

4. After all needed images pulling on your docker you're must clone *YML* files and *dockerfile* from my github repository 

#### dockerfile

    version: "3.7"
    services:
        web: 
            image: ranur/codeigniter:3.11-sessions
            volumes:
                - ./setup:/app
            ports:
                - 81:8000
            depends_on:
                - mariadb
            container_name: dasboard
        mariadb:
            image: docker.io/bitnami/mariadb:10.3
            environment:
                - ALLOW_EMPTY_PASSWORD=yes
                - MYSQL_ROOT_PASSWORD=123
                - MYSQL_USER=user
                - MYSQL_PASSWORD=user
                - MYSQL_DATABASE=db_mariaDB
            ports:
                - 3306:3306
            volumes:
                - ./db_sqldata/db_bm.sql:/docker-entrypoint-initdb.d/dump.sql
            container_name: mariaDB
        phpmyadmin:
            image: phpmyadmin/phpmyadmin:latest
            links:
                - mariadb
            ports:
                - 85:80
            environment:
                PMA_HOST: mariadb
                MYSQL_ROOT_PASSWORD: 12345
            container_name: phpmyadmin
