#!/bin/bash
sudo apt update
sudo apt install apache2
sudo ufw allow in "WWW Full"
sudo apt install mariadb-server
sudo mysql_secure_installation
sudo apt install php libapache2-mod-php php-mysql
sudo apt install phpmyadmin
sudo apt install composer


VARWEBDIR="/var/www/htdocs/"