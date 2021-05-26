# DEVBM-imagekosong

Repository Images Kosong Docker Barang Mudo:

## Doker Compose Container Service List 
    1. Container Web
        ..* php:7.2.26-apache
        ..* git
        ..* Composer (*CI4*)
        ..* mysqli (*php extensions*)
        ..* 
    2. Container db
        ..* mysql port 3306
    3. PHPmyadmin

### Aktifkan remote mysql ke sqlyoq dengan perintah berikut di dalam mysql containernya
  mysql -u root -p
    ALTER USER 'root'@'localhost' IDENTIFIED BY '<password>';
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<password>';
    ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '<password>';