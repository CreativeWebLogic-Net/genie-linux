#!/bin/bash
oracle lamp server install
zypper in apache2
systemctl start apache2
systemctl restart apache2
systemctl stop apache2
systemctl enable apache2

PORT=10001

# Edit the SuSEfirewall2 configuration file
sed -i 's/FW_CONFIGURATION_EXT=""/FW_CONFIGURATION_EXT="apache2"/' /etc/sysconfig/SuSEfirewall2

# Restart SuSEfirewall2 to apply the changes
/sbin/SuSEfirewall2

systemctl restart SuSEfirewall2

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

sudo zypper install php php-mysql php-gd php-mbstring apache2-mod_php7

sudo a2enmod php7
sudo systemctl restart apache2
sudo zypper install mariadb mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo zypper install phpMyAdmin
sudo zypper install php-composer



VARWEBDIR="/srv/www/htdocs/"