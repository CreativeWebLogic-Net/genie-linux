#!/bin/bash
sudo dnf install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo firewall-cmd --permanent --add-service={http,https}
sudo firewall-cmd --reload

sudo dnf install mariadb mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo dnf install php php-mysql
sudo yum install phpmyadmin
sudo dnf install composer


VARWEBDIR="/var/www/htdocs/"