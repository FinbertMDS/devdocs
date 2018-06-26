#!/bin/bash
echo "install magento version $1"

echo "install database"
DBNAME="magento_""$1"
# mysql -u root -p -e "CREATE DATABASE $DBNAME;"
# mysql -u root -p $DBNAME < /media/finbert/DATA2/documents/install_magento/magento_2.1.sql

echo "copy magento to server"
# sudo rm -rf /var/www/html/$1
# mkdir /var/www/html/$1
# cp -a /media/finbert/DATA2/documents/install_magento/$1/* /var/www/html/$1/
# cp /media/finbert/DATA2/documents/install_magento/.htaccess /var/www/html/$1/
# cp /media/finbert/DATA2/documents/install_magento/.htaccess.sample /var/www/html/$1/

echo "install magento"
MAGENTO_HOST_NAME="127.0.0.1/$1"
cd /var/www/html/$1
sudo chmod -R 777 ./
sudo php bin/magento setup:install \
    --language="en_US" \
    --timezone="UTC" \
    --currency="USD" \
    --base-url="http://${MAGENTO_HOST_NAME}/" \
    --admin-firstname="admin" \
    --admin-lastname="admin" \
    --backend-frontname="admin" \
    --admin-email="admin1@example.com" \
    --admin-user="admin1" \
    --admin-password="admin123" \
    --use-rewrites=1 \
    --admin-use-security-key=0 \
    --db-name="${DBNAME}" \
    --db-user="root" \
    --db-password="root"
sudo chmod -R 777 ./
sudo php bin/magento setup:di:compile
sudo php bin/magento setup:upgrade
sudo php bin/magento setup:static-content:deploy
sudo php bin/magento deploy:mode:set developer
sudo php bin/magento cache:flush
sudo chmod -R 777 ./

echo "install extension"
cd /media/finbert/DATA2/projects/magestore
cp -a OS-Inventorysuccess-M2/* /var/www/html/$1/
cp -a PurchaseOrderSuccess-M2/* /var/www/html/$1/
cp -a WebPOS-Magento2-New/* /var/www/html/$1/
cp -a ReportSuccess-M2/* /var/www/html/$1/
cp -a omc-starter/* /var/www/html/$1/
mkdir /var/www/html/$1/app/code/Magestore/SupplierSuccess/
cp -a SupplierSuccess/* /var/www/html/$1/app/code/Magestore/SupplierSuccess/

cd /var/www/html/$1
sudo chmod -R 777 ./
sudo php bin/magento setup:upgrade
sudo php bin/magento module:disable Magestore_StockManagementSuccess
sudo php bin/magento deploy:mode:set developer
sudo php bin/magento cache:flush
sudo chmod -R 777 ./

google-chrome "http://${MAGENTO_HOST_NAME}/admin"
