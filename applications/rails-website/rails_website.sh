#!/bin/bash

# For Debugging (print env. variables, define command tracing)
# set -o xtrace
# env
# set


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
#apt-get install ruby-dev
ruby -v  # checking ruby by printing the installed version


echo "****************************************************************"
echo "Installing NodeJS"
echo "****************************************************************"
apt-get install nodejs -y


echo "****************************************************************"
echo "Installing Rails"
echo "****************************************************************"
gem install rails


echo "****************************************************************"
echo "Installing MySQL Client"
echo "****************************************************************"
apt-get install mysql-client -y
apt-get install libmysqlclient-dev -y
gem install mysql2


echo "****************************************************************"
echo "Installing website (from artifacts) and retrieving dependencies"
echo "****************************************************************"
mkdir /home/artifacts
cd /home/artifacts
git clone https://github.com/QualiNext/colony_sample_rails_website.git

mkdir /home/ubuntu/wwwroot;
cp -a /home/artifacts/colony_sample_rails_website/website/. /home/ubuntu/wwwroot

#tar -xvf ${ARTIFACTS_PATH}/website.tar.gz -C /home/ubuntu/wwwroot; # replace with recursive copy
cd /home/ubuntu/wwwroot
bundle install


echo "****************************************************************"
echo "Running DB migration"
echo "****************************************************************"
rake db:migrate

