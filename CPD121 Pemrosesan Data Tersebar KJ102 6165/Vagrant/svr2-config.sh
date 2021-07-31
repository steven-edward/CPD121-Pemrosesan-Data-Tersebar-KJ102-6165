#!/bin/bash

echo 'Starting Provision : svr2'$1
sudo apt-get update
sudo apt-get install nginx -y
echo "Machine : srv2"$1 >> /usr/share/nginx/html/index.html
echo 'Provision srv2'$1 'complete'