#!/bin/bash
echo "pass: ubuntu"
openssl req -new -nodes -out server.csr -newkey rsa:2048 -keyout server.key
openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 3658 -sha256 -extfile v3.ext
sudo cp server.crt /etc/ssl/certs/ssl-cert-snakeoil.pem
sudo cp server.key /etc/ssl/private/ssl-cert-snakeoil.key
sudo service apache2 restart
