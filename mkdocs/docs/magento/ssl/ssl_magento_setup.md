# Overview
Setup SSL for Magento site after install

## Create site available for apache2
1. Copy ssl to apache2
```bash
sudo cp server.crt /etc/ssl/certs/ssl-cert-snakeoil.pem
sudo cp server.key /etc/ssl/private/ssl-cert-snakeoil.key
```
2. Create file /etc/apache2/sites-available/m223.conf
```text
<VirtualHost *:80>
    ServerName m223.com
    ServerAlias www.m223.com
    ServerAlias *.m223.com
    ServerAdmin magento@localhost
    DocumentRoot /var/www/html/ce223
	ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory "/var/www/html/ce223">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
    </Directory>

</VirtualHost>

<VirtualHost _default_:443>
    ServerAdmin admin@example.com
    ServerName m223.com
    ServerAlias www.m223.com
    ServerAlias *.m223.com
    ServerAdmin magento@localhost
    DocumentRoot /var/www/html/ce223
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    SSLEngine on
    SSLCertificateFile  /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    <Directory "/var/www/html/ce223">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
    </Directory>
</VirtualHost>
```
```bash
sudo a2ensite m223.conf
sudo service apache2 reload
```
## Note
- View website [https://magenticians.com/magento-ssl-configuration-issues-resolved/](https://magenticians.com/magento-ssl-configuration-issues-resolved/) to setup in mysql
    - Mysql: In database in table 'core_config_data' set web/secure/use_in_frontend and web/secure/use_in_adminhtml = 1
- Flush cache magento after ensite apache, Clear cache of browser.
    - Clear the cache in both the cases by deleting /var/cache
- Error cannot call Rest API Magento
    Uncomment 2 line in file .htaccess in server magento: Ex: /var/www/html/ce223/.htaccess
    ```txt
    Options -MultiViews
    RewriteRule ^api/rest api.php?type=rest [QSA,L]
    ```