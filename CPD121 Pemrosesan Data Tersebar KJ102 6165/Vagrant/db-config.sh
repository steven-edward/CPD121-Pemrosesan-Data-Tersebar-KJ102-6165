#!/bin/bash

echo 'Starting Provision : svr2'$1
debconf-set-selections <<< 'mysql-server mysql-server/root_password password MySuperPassword'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MySuperPassword'
sudo apt-get update
sudo apt-get -f install -y
echo 'Provision srv2'$1 'complete'