#!/bin/bash
sudo pacman -Syu
sudo pacman -S apache
# edit apache config
sudo sed -i 's/^LoadModule unique_id_module/#LoadModule unique_id_module/' /etc/httpd/conf/httpd.conf

# edit hosts config
# Set your hostname
HOSTNAME="droplet1"

# Add the hostname to /etc/hosts
echo "127.0.0.1       localhost.localdomain   localhost $HOSTNAME" | sudo tee -a /etc/hosts


sudo systemctl restart httpd
sudo pacman -S mysql
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo mysql_secure_installation
sudo pacman -S php php-apache


sudo pacman -S phpmyadmin
sudo pacman -S composer

sudo systemctl restart httpd

VARWEBDIR="/var/www/htdocs/"