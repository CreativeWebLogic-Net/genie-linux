#!/bin/bash

# Detect the Linux distribution

echo "Linux Genie Lamp Install Script will detect your linux version then install the Web Server."
echo "We will also Install the latest version of our CWLNet Website Helper, it will be installed in your web servers scripts root directory."

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
            echo "Unknown distribution. Exiting Install Script."
            exit 0
            ;;
    esac
else
    echo "Unknown distribution. Exiting Install Script."
    exit 0
fi
echo "Genie will create an original copy of Website Helper in your Home Diretory."
cd ~
VAR1="https://f005.backblazeb2.com/file/iCWLNet-Website-Assets/downloads/"
VAR2="website-helper-${ID}-install.sh"
VAR3="$VAR1$VAR2"

if [ -e "$VAR2" ]; then
    echo "Your Linux Version Installer -> $FILE | already exists."
else
    wget "$VAR3"
    if [ -e "$VAR2" ]; then
        echo "Genie has downloaded your Linux version Installer Script."
    else
        echo "Genie cannot connect to main mirror, trying an alternate server."
        VAR1="https://github.com/CreativeWebLogic-Net/genie-linux/blob/main/"
        VAR3="$VAR1$VAR2"
        wget "$VAR3"
    fi
fi
if [ ! -e "$VAR2" ]; then
    echo "Failure downloading setup script -> $DIRECTORY | Exiting Install Script."
    exit 0
fi


sudo chmod 777 "$VAR2"
sudo "./$VAR2"
DIRECTORY="./website-helper"
if [ -d "$DIRECTORY" ]; then
    echo "Your Original Website Helper Version in -> $DIRECTORY already exists."
else
    echo "Your Original Website Helper Version in -> $DIRECTORY has been created."
    mkdir $DIRECTORY
fi

if [ ! -d "$DIRECTORY" ]; then
    echo "Failure creating Original install directory -> $DIRECTORY | Exiting Install Script."
    exit 0
fi

VAR2="website-helper.zip"
mv "$VAR2" $DIRECTORY
cd $DIRECTORY

if [ -e "$VAR2" ]; then
    echo "Your Website Helper Archive ->$FILE already exists."
else
    
    VAR3="$VAR1$VAR2"
    echo "Your Website Helper Archive ->$VAR3 will be downloaded from the server."
    wget "$VAR3"
    if [ -e "$VAR2" ]; then
        echo "Genie has downloaded your Website Helper Archive."
    else
        echo "Genie cannot connect to main mirror, trying an alternate server."
        VAR1="https://github.com/CreativeWebLogic-Net/genie-linux/blob/main/"
        VAR3="$VAR1$VAR2"
        wget "$VAR3"
    fi
fi

if [ ! -e "$VAR2" ]; then
    echo "Failure downloading setup script -> $DIRECTORY | Exiting Install Script."
    exit 0
fi

unzip "./$VAR2"
cp -R ./* "$VARWEBDIR"

# Print a summary
echo "Genie Lamp Server created, CWLNet Website Helper Installed To main Apache Scripts Document Root."
