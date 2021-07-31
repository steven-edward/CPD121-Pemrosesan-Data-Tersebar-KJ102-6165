#!/bin/bash

echo 'Starting Provision : svr1'
sudo apt-get update
sudo apt-get install nginx -y
sudo service nginx stop
sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default
echo "upstream myappl {
    server 10.1.0.102
    server 10.1.0.103
}

server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /usr/share/nginx/html;
    index index.html index.htm;

    location / {
        proxy_pass http://myappl;
    }
} " >> /etc/nginx/sites-enabled/default
sudo service nginx start
echo "Machine : srv1" >> /usr/share/nginx/html/index.html
echo 'Provision srv1 complete'