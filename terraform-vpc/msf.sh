#!/bin/bash

# install metasploit onto kali instance

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
#apt-get -y install nginx

# make sure nginx is started
sudo msfdb init
# Start the web service listening on any host address
sudo msfdb --component webservice --address 0.0.0.0 start 
