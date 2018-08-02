# Overview
This is our developer docs about [How to install magento](https://devdocs.magento.com/guides/v2.2/install-gde/bk-install-guide.html):

## Package
- Magento CE: http://pubfiles.nexcess.net/magento/ce-packages/
- Magento EE: https://drive.google.com/drive/u/1/folders/0B4o2mdOYLZI6bVNETzU0M0RBdFU
 
## Install Magento
Install Apache2, Mysql on Ubuntu 16.04: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

- Install Lamp server: 
```bash
sudo apt-get install lamp-server^
```
- Apache install and setup:
```bash
sudo apt-get update
sudo apt-get install apache2
```
- Adjust the Firewall to Allow Web Traffic:
```bash
sudo ufw app list
sudo ufw allow in "Apache Full"
```
- Install MySQL:
```bash
sudo apt-get install mysql-server
```
- Install PHP:
```bash
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
```
```bash
sudo nano /etc/apache2/mods-enabled/dir.conf
```
Change **dir.conf** to 
```text
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
```
Restart Apache2
```bash
sudo systemctl restart apache2
```
- Apache setup

Create file **magento.conf**
```bash
sudo nano /etc/apache2/sites-available/magento.conf
```
with text:
```text
<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
    </Directory>
</VirtualHost>
```
```bash
sudo a2ensite magento.conf
sudo a2dissite 000-default.conf
sudo service apache2 reload
```
- PHP setup
```bash
sudo nano /etc/php/7.0/apache2/php.ini
```
Find and update info:
```text
max_execution_time=300
max_input_time=600
post_max_size=80M
max_file_uploads=200
memory_limit=2048M
```
Install extension PHP:
```bash
sudo apt-get install php-mcrypt php-curl php-gd libcurl3 php-intl php-xsl
```
Run command:
```bash
sudo a2enmod rewrite
sudo phpenmod mcrypt
sudo service apache2 restart
```

- Create database:
```bash
mysql -u root -p
CREATE DATABASE magento;
```
- Config auth magento
https://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html Create file auth.json with content below:
```bash
nano ~/.composer/auth.json
```
```text
{
    "http-basic": {
        "repo.magento.com": {
            "username": "a3380186b4ffb670466a01331a3fb375",
            "password": "cfe4874a50552827da901971d249322a"
        }
    }
}
```
- Download package Magento and create folder in apache 
```bash
mkdir /var/www/html/magento
```
copy it to **/var/www/html/magento**. Then open link in browser [http://127.0.0.1/magento/setup](http://127.0.0.1/magento/setup) to setup magento.
## Install extension
### Magento 1
- Copy extension to magento root folder.
- Flush cache in backend or remove folder "var/cache"
### Magento 2
- Copy extension to magento root folder.
- Run commands:
```bash
cd /var/www/html/magento
php bin/magento setup:di:compile
php bin/magento setup:upgrade
php bin/magento setup:static-content:deploy
php bin/magento cache:flush
php bin/magento deploy:mode:set developer
php bin/magento cache:flush
sudo chmod -R 777 ./
```
## Reinstall
After install magento want reinstall magento
### Magento 1: 
- Comment all info in file "app/etc/local.xml".
- Enter link [http://127.0.0.1/magento](http://127.0.0.1/magento/setup) in browser auto run setup again.
- Note: If not want reinstall after comment file "local.xml" then need uncomment file "local.xml" and then remove all file in "var/cache" by command line
```bash
rm -rf /var/www/html/magento/var/cache
```
### Magento 2
- Comment all info in file "app/etc/env.php".
- Enter link [http://127.0.0.1/magento/setup](http://127.0.0.1/magento/setup) in browser auto run setup again.