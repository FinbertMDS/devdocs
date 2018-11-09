# Overview
This is our developer docs about Config SSL for Server

## Tools
https://letsencrypt.org/

## [Setup](https://certbot.eff.org/lets-encrypt/ubuntuxenial-nginx)
### Ubuntu 16.04, Nginx
```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx  -y
```
```bash
sudo certbot certonly --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --manual --preferred-challenges dns -d 'finbert-test.ml,*.finbert-test.ml'
```
```bash
sudo certbot renew --dry-run
```
### Note
- If after install, you still not access SSL, can you disable SSL on server. You can enable SSL server with command
    ```bash
    sudo ufw allow 'Nginx Full'
    sudo ufw delete allow 'Nginx HTTP'
    ```