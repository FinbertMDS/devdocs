#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "need input site available nginx"
  exit
fi
if [[ ! -f /etc/nginx/sites-available/$1 ]]; then
  echo "file site available not exist"
  exit
fi
if [[ ! -f /etc/nginx/sites-enabled/$1 ]]; then
    sudo rm /etc/nginx/sites-enabled/$1
fi
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo service nginx restart
