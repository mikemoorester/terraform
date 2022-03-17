#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# clone dvwa into the /var/www/html directory
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA

# move to lc folder
sudo mv DVWA dvwa
sudo chmod -R 777 dvwa/
cd dvwa/config
sudo cp config.ini.php.dist config.inc.php

# TODO 
# need to set the db_database password and db_user in the config file

# make sure mysql is installed
sudo apt install default-mysql-server

# start the mysql service
sudo service mysql start

# can check this is running using the command
# - systemctl status mysql

# Login in to the mysql database
# - sudo mysql -u root -p
# just hit enter for the password
# create a user with the command:
# - create user 'user'@'127.0.0.1' identified by 'pass';
# - grant all privileges on dvwa.* to 'user'@'127.0.0.1' identified by 'pass';

# install PhP
sudo apt update
sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ buster main" | sudo tee /etc/apt/sources.list.d/php.list
#========= add the repository
sudo apt update
sudo apt install php7.4 -y
# Install php extensions
sudo apt install php7.4-{cli,json,imap,bcmath,bz2,intl,gd,mbstring,mysql,zip}

#========= Configure Apache
cd /etc/php/7.4/apache2

# change the configuration in php.ini
sudo perl -i -pe 's/allow_url_fopen = Off/allow_url_fopen = On/' php.ini
sudo perl -i -pe 's/allow_url_include = Off/allow_url_include = On/' php.ini

# start the apache server
sudo service apache2 start
# check the service is running
# - systemctl status apache2
# check that the dvwa is working
# http://127.0.0.1/dvwa/
