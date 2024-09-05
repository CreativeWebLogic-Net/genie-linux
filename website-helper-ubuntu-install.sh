#!/bin/bash
sudo apt-get update
sudo apt-get install -y tasksel
sudo tasksel install lamp-server

sudo apt update
sudo apt install php
sudo apt install phpmyadmin

sudo apt install composer


VARWEBDIR="/var/www/htdocs/"