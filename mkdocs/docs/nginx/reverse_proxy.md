# Overview
This is our developer docs about Use Nginx as Reverse Proxy.

## Simple reverse proxy
```markdown
upstream jenkins {
    server 172.17.0.1:8080 weight=1;
}

server {
  listen          80;
  server_name     jenkins.example.com;

  location / {
    proxy_pass      http://jenkins;
  }
}
```
## Reverse proxy redirect HTTP to HTTPS for site Magento on Docker
### Add SSL to folder `/etc/nginx/ssl/`
### Magento 1
```markdown
upstream magento1_ssl {
    server 172.17.0.1:9096 weight=1;
}

server {
    listen 80;
    server_name magento1.com;
    return 301 https://$host$request_uri;
}

server {
  listen 443;
  server_name magento1.com;
  ssl_certificate /etc/nginx/ssl/magento1_ssl.crt;
  ssl_certificate_key /etc/nginx/ssl/magento1_ssl.key;
  ssl on;
  ssl_session_cache  builtin:1000  shared:SSL:10m;
  ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    proxy_pass https://magento1_ssl;
  }

  location /admin {
    return 301 /index.php/admin;
  }
}
```
### Magento 2
```markdown
upstream magento2_ssl {
    server 172.17.0.1:9092 weight=1;
}

server {
    listen 80;
    server_name magento2.com;
    return 301 https://$host$request_uri;
}

server {
  listen 443;
  server_name magento2.com;
  ssl_certificate /etc/nginx/ssl/magento2_ssl.crt;
  ssl_certificate_key /etc/nginx/ssl/magento2_ssl.key;
  ssl on;
  ssl_session_cache  builtin:1000  shared:SSL:10m;
  ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    proxy_pass https://magento2_ssl;
  }
}
```