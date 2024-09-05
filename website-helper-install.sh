#!/bin/bash

# Detect the Linux distribution



if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    case "$ID" in
        ubuntu)
            echo "Detected Ubuntu."
            # Install packages for Ubuntu (e.g., Apache, PHP, MySQL)
            VARWEBDIR="/var/www/htdocs/"
            ;;
        centos)
            echo "Detected CentOS."
            # Install packages for CentOS (e.g., httpd, php, mariadb)
            VARWEBDIR="/var/www/htdocs/"
            ;;
        debian)
            echo "Detected Debian."
            # Install packages for Debian (e.g., apache2, php, mariadb-server)
            VARWEBDIR="/var/www/htdocs/"
            ;;
        oracle)
            echo "Detected oracle."
            # Install packages for Debian (e.g., apache2, php, mariadb-server)
            VARWEBDIR="/var/www/htdocs/"
            ;;
        redhat)
            echo "Detected redhat."
            VARWEBDIR="/var/www/htdocs/"
            ;;
        opensuse)
            echo "Detected opensuse."
            VARWEBDIR="/srv/www/htdocs/"
            ;;
        arch)
            echo "Detected arch."
            VARWEBDIR="/var/www/htdocs/"
            ;;
        mint)
            echo "Detected mint."
            VARWEBDIR="/var/www/htdocs/"
            ;;
        *)
            echo "Unknown distribution."
            ;;
    esac
else
    echo "Unable to determine distribution."
fi

cd ~
VAR1="https://f005.backblazeb2.com/file/iCWLNet-Website-Assets/downloads/"
VAR2="website-helper-${ID}-install.sh"
VAR3="$VAR1$VAR2"
wget "$VAR3"
sudo chmod 777 "$VAR2"
sudo "./$VAR2"
mkdir ./website-helper
mv "$VAR2" ./website-helper
cd ./website-helper
VAR2="website-helper.zip"
VAR3="$VAR1$VAR2"
wget "$VAR3"
unzip "./$VAR2"
cp -R ./* "$VARWEBDIR"

# Generate the alias configuration lines
PROJECT_PATH="$VARWEBDIR"
ALIAS_NAME="composer"


ALIAS_CONFIG="Alias /$ALIAS_NAME $PROJECT_PATH/vendor\n<Directory $PROJECT_PATH/vendor>\n    Options Indexes FollowSymLinks\n    AllowOverride None\n    Require all granted\n</Directory>"

# Append the configuration to the Apache file
echo -e "$ALIAS_CONFIG" | sudo tee -a /etc/apache2/apache2.conf
# Print a summary
echo "Script execution completed."
