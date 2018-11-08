# Overview
This is our developer docs about Use Nginx to Web server

## [Install Nginx](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04)
1. Install Nginx
    ```bash
    sudo apt update
    sudo apt install nginx -y
    ```
2. Adjusting the Firewall
    ```bash
    sudo ufw allow 'Nginx HTTP'
    ```
    
    - Note:
        - Check status *ufw*
            ```bash
            sudo ufw status
            ```
            
            If Status is _inactive_ then [Enable Ufw](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04) by command
            ```bash
            sudo ufw enable
            ```
## Setting Up Server Blocks
1. Installing PHP and Configuring Nginx to Use the PHP Processor 
```bash
sudo apt install php-fpm php-mysql -y
```
2. Config Site available nginx: */etc/nginx/sites-available/nginx-server*
```markdown
server {
	listen 80;
	listen [::]:80;

	server_name nginx.example.com;

	root /var/www/html;
	index index.php index.html index.htm index.nginx-debian.html;

	location / {
		try_files $uri $uri/ =404;
	}
    location ~ \.php$ {
      include snippets/fastcgi-php.conf;
      fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }
    location ~ /\.ht {
      deny all;
    }
}
```
3. Enable new server block
```bash
sudo ln -s /etc/nginx/sites-available/nginx-server /etc/nginx/sites-enabled/
```
4. Test new config file and reload nginx
```bash
sudo nginx -t
sudo systemctl reload nginx
```
