#!/usr/bin/env bash

# Update packages and Upgrade system
echo "****************************************************************"
echo "Updating System"
echo "****************************************************************"
apt-get update -y


echo "****************************************************************"
echo "Installing NodeJS"
echo "****************************************************************"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
node -v
npm install npm --global



echo "****************************************************************"
echo "Get the web application from github"
echo "****************************************************************"
mkdir /home/artifacts
cd /home/artifacts || exit
git clone https://github.com/cloudshell-colony/sample_micro_services_nodejs_source.git


echo "****************************************************************"
echo "Installing applicaion dependencies"
echo "****************************************************************"
cd sample_micro_services_nodejs_source/api-gateway || exit
npm install;

