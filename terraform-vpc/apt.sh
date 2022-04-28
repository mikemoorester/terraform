#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install dependencies 
apt-get update
apt upgrade
apt -y install nmap git
apt -y install python3 python3-pip 

# install postgreSQL
apt -y install postgresql postgresql-contrib
# start the service
systemctl start postgresql.service
# create the database apt
sudo -u postgres createdb apt

# Python dependencies
pip3 install python-nmap 
pip3 install defusedxml
pip3 install psycopg2-binary
echo "alias python='python3'" >> /home/ubuntu/.bashrc
