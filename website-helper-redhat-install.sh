#!/bin/bash
sudo dnf update
sudo dnf install httpd
sudo dnf install mariadb-server
sudo dnf install @php
sudo chown -R apache:apache /var/www/html/*
sudo chcon -t httpd_sys_rw_content_t /var/www/html/ -R
sudo yum install phpmyadmin
sudo dnf install composer


VARWEBDIR="/var/www/htdocs/"