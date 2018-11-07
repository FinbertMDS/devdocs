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
sudo apt-get install python-certbot-nginx 
```
```bash
sudo certbot -a dns-plugin -i nginx -d "*.example.com" -d example.com --server https://acme-v02.api.letsencrypt.org/directory
```
```bash
sudo certbot renew --dry-run
```