#!/bin/bash
# only allow install versions in array versions: ce1938 | ce223 | ce225
MAGENTO_DIR='/var/www/html/'$1
MAGENTO_VERSIONS=("ce1938")
MAGENTO_HOST_NAME="localhost/$1"
MAGENTO_DOWNLOAD_URL=""
MAGENTO_DOWNLOAD_FILENAME=$1".tar.gz"
MAGENTO_SAMPLE_DATA_URL="https://nchc.dl.sourceforge.net/project/mageloads/assets/1.9.1.0/magento-sample-data-1.9.1.0.tar.gz"
MAGENTO_SAMPLE_DATA_FILENAME="magento-sample-data-1.9.1.0.tar.gz"

echo "installing magento version $1"
if [[ ! " ${MAGENTO_VERSIONS[@]} " == $1 ]]; then
    echo "this version $1 not support install";
    exit
fi

echo "setup database"
DB_NAME="magento_"$1
if [ $1 = "ce1938" ]; then
    mysql -u root -p -e "DROP DATABASE IF EXISTS magento_ce1938; CREATE DATABASE magento_ce1938"
fi

sudo rm -rf $MAGENTO_DIR
mkdir $MAGENTO_DIR
if [ ! -f "/var/www/html/"MAGENTO_SAMPLE_DATA_FILENAME ]; then
    wget -O "/var/www/html/"MAGENTO_SAMPLE_DATA_FILENAME $MAGENTO_SAMPLE_DATA_URL
fi
tar -xvzf "/var/www/html/"MAGENTO_SAMPLE_DATA_FILENAME -C $MAGENTO_DIR
mysql -u root -p "$DBNAME" < $MAGENTO_DIR"/magento_sample_data_for_1.9.2.4.sql"

echo "copy magento to server"
if [ $1 = "ce1938" ]; then
    MAGENTO_DOWNLOAD_URL="http://pubfiles.nexcess.net/magento/ce-packages/magento-1.9.3.8.tar.gz"
    MAGENTO_HOST_NAME="m1938.com"
fi
if [ ! -f "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME ]; then
    wget -O "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME $MAGENTO_DOWNLOAD_URL
fi
tar -xvzf "/var/www/html/"$MAGENTO_DOWNLOAD_FILENAME -C $MAGENTO_DIR

