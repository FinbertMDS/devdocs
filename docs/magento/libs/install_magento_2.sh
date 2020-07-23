#!/bin/bash
# only allow install versions in array versions: ce223 | ce225 | pwa
MAGENTO_DIR='/var/www/html/'$1
MAGENTO_VERSIONS=("ce223" "ce225" "pwa")
MAGENTO_HOST_NAME="localhost/$1"
MAGENTO_DOWNLOAD_URL=""
MAGENTO_DOWNLOAD_FILENAME=$1".tar.gz"

echo "installing magento version $1"
if [[ ! " ${MAGENTO_VERSIONS[@]} " =~ $1 ]]; then
    echo "this version $1 not support install";
    exit
fi

echo "setup database"
DB_NAME="magento_"$1

if  [ $1 = "ce223" ]; then
    mysql -u root -p -e "DROP DATABASE IF EXISTS magento_ce223; CREATE DATABASE IF NOT EXISTS magento_ce223"
fi
if  [ $1 = "ce225" ]; then
    mysql -u root -p -e "DROP DATABASE IF EXISTS magento_ce225; CREATE DATABASE IF NOT EXISTS magento_ce225"
fi
if  [ $1 = "pwa" ]; then
    mysql -u root -p -e "DROP DATABASE IF EXISTS magento_pwa; CREATE DATABASE IF NOT EXISTS magento_pwa"
fi
echo "copy magento to server"
if  [ $1 = "ce223" ]; then
    MAGENTO_DOWNLOAD_URL="http://pubfiles.nexcess.net/magento/ce-packages/magento2-with-samples-2.2.3.tar.gz"
    MAGENTO_HOST_NAME="m223.com"
fi
if  [ $1 = "ce225" ]; then
    MAGENTO_DOWNLOAD_URL="http://pubfiles.nexcess.net/magento/ce-packages/magento2-with-samples-2.2.5.tar.gz"
    MAGENTO_HOST_NAME="m225.com"
fi
if  [ $1 = "pwa" ]; then
    MAGENTO_DOWNLOAD_URL="http://pubfiles.nexcess.net/magento/ce-packages/magento2-latest-with-samples.tar.gz"
    MAGENTO_HOST_NAME="pwa.com"
    MAGENTO_DOWNLOAD_FILENAME="magento2-latest-with-samples.tar.gz"
fi

if [ ! -f "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME ]; then
    wget -O "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME $MAGENTO_DOWNLOAD_URL
fi
sudo rm -rf $MAGENTO_DIR
mkdir $MAGENTO_DIR
tar -xvzf "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME -C $MAGENTO_DIR

echo "install magento"
cd $MAGENTO_DIR
sudo chmod -R 777 ./
sudo php bin/magento setup:install \
    --language="en_US" \
    --timezone="UTC" \
    --currency="USD" \
    --base-url="https://${MAGENTO_HOST_NAME}/" \
    --admin-firstname="admin" \
    --admin-lastname="admin" \
    --backend-frontname="admin" \
    --admin-email="admin@example.com" \
    --admin-user="admin" \
    --admin-password="admin123" \
    --use-rewrites=1 \
    --admin-use-security-key=0 \
    --db-name=$DB_NAME \
    --db-user="root" \
    --db-password="root" \
    --db-prefix="m_" 
sudo chmod -R 777 ./
sudo php bin/magento setup:di:compile
sudo php bin/magento setup:upgrade
sudo php bin/magento setup:static-content:deploy -f
sudo php bin/magento deploy:mode:set developer
sudo php bin/magento cache:flush
sudo chmod -R 777 ./

echo "install extension magento 2"

echo "install extension pwa"

cd $MAGENTO_DIR
sudo chmod -R 777 ./
sudo php bin/magento setup:upgrade
sudo php bin/magento deploy:mode:set developer
sudo php bin/magento cache:flush
sudo chmod -R 777 ./