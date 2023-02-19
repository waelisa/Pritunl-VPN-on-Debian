
#!/bin/bash
#############################################################################################################################
# The MIT License (MIT)
# Wael Isa
# 19/2/2023
# https://github.com/waelisa/Pritunl-VPN-on-Debian
#############################################################################################################################
#Install basic
apt update && apt install curl pip -y
pip install apt-mirror-updater
sudo apt update && sudo apt -y full-upgrade
sudo apt install gpg curl gnupg2 software-properties-common apt-transport-https lsb-release ca-certificates
#Import MongoDB APT repository keys
curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-5.gpg
# add key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7AE645C0CF8E292A
# Add Pritunl repository
echo "deb http://repo.pritunl.com/stable/apt $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/pritunl.list
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
#Install Pritunl and MongoDB
sudo apt update
sudo apt install mongodb-org  pritunl -y
#start and enable Pritunl and MongoDB
sudo systemctl start pritunl mongod
sudo systemctl enable pritunl mongod
#############################################################################################################################
