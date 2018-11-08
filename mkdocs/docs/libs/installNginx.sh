#!/usr/bin/env bash

sudo apt update
sudo apt install nginx -y
sudo ufw enable
sudo ufw allow 'Nginx HTTP'
sudo apt install php-fpm php-mysql -y
sudo service nginx restart