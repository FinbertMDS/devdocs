#!/usr/bin/env bash

echo "Deploy to Page"
cd mkdocs
mkdocs build -d ../docs
while [ ! -f ../docs/index.html ]
do
  sleep 1
done
sshpass -p 'Ngovan0241' scp -r helloworld finbert@45.77.42.74:/var/www/html/helloworld
echo "Deploy done to page: http://45.77.42.74/docs"
