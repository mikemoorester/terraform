#!/bin/bash

# install metasploit onto kali instance

# sleep until instance is ready
#until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
#  sleep 1
#done

# update the repository info 
#apt-get update
apt install nmap
# install form the nightly build of mfsconsole

# make sure nginx is started
#sudo msfdb init
# Start the web service listening on any host address
#sudo msfdb --component webservice --address 0.0.0.0 start 

#The following script invocation will import the Rapid7 signing key and setup the package for supported Linux and macOS systems:
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

/sbin/useradd -c cyber cyber -p cyber
# Start the data base
echo "Starting msf database"
sudo -u cyber msfdb init 
- include webservice at command line
#msfdb start
# Not sure how to specify the username and password form the command line
# Need to turn antivirus software off on windows
# see if we can exclude: 
# /opt/metasploit-framework
# Start the webservice
sudo -u cyber msfdb --component webservice --address 0.0.0.0 start
# To stop run msfdb --component webservice stop
