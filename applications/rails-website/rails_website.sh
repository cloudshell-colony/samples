#!/usr/bin/env bash

# Stop Script on Error
set -e

# For Debugging (print env. variables into a file)  
printenv > /var/log/colony-vars-"$(basename "$BASH_SOURCE" .sh)".txt


# Update packages and Upgrade system
echo "****************************************************************"
echo "Updating System"
echo "****************************************************************"
apt-get update -y


echo "****************************************************************"
echo "Installing Build Essentials"
echo "****************************************************************"
apt-get install build-essential patch -y
apt-get install ruby-dev zlib1g-dev liblzma-dev -y


echo "****************************************************************"
echo "Installing Ruby"
echo "****************************************************************"
apt-get install ruby-full -y 
echo 'gem: --no-document' >> ~/.gemrc
gem update --system

echo "****************************************************************"
echo "Installing Rails"
echo "****************************************************************"
gem install rails -v 3.0.1

echo "****************************************************************"
echo "Installing MySQL Client"
echo "****************************************************************"
apt-get install mysql-client -y
apt-get install libssl-dev libmysqlclient-dev -y
gem install mysql2


echo "****************************************************************"
echo "Installing website (from artifacts) and retrieving dependencies"
echo "****************************************************************"
mkdir /home/artifacts
cd /home/artifacts || exit
git clone https://github.com/cloudshell-colony/sample_rails_source.git


cd /home/artifacts/sample_rails_source/website || exit
bundle install 


echo "****************************************************************"
echo "Running DB migration"
echo "****************************************************************"
rake db:migrate

