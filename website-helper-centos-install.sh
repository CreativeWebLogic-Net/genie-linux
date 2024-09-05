#!/bin/bash
sudo dnf update
sudo dnf install httpd httpd-tools
sudo systemctl enable httpd
sudo systemctl start httpd
sudo dnf install mariadb-server mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo dnf install php php-mysqlnd
sudo yum install phpmyadmin
sudo dnf install composer

sudo systemctl restart httpd


VARWEBDIR="/var/www/htdocs/"