#!/bin/bash

# Create temporary directory and navigate to it
mkdir -p /tmp/ztmp && cd /tmp/ztmp

# Install necessary packages and update system
sudo yum -y install epel-release iptables wget curl nano make 
sudo yum -y update 
sudo yum -y upgrade 

# Download and run proxy setup script from Gist
wget --no-check-certificate 'https://gist.githubusercontent.com/johnphambtc/a8e77a4d92053442bf16885816dea028/raw/b4a7c8bb66f3a034f403535c95f251cb83947998/proxy_vultr.sh' -O myvps.sh 
chmod +x myvps.sh && sudo bash ./myvps.sh

# Allow firewall ports for proxy usage (example ports 10000-10003)
firewall-cmd --permanent --zone=public --add-port=10000-10003/tcp 
firewall-cmd --reload 

# Check generated proxy file location 
nano /home/proxy-installer/proxy.txt 

# Download generated proxy file (replace 'your_code' with actual code)
wget https://transfer.sh/your_code/proxy.zip 
