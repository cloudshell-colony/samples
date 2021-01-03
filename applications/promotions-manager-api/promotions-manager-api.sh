#!/bin/bash
echo '=============== Staring init script for Promotions Manager API ==============='

# save all env for debugging
printenv > /var/log/colony-vars-"$(basename "$BASH_SOURCE" .sh)".txt

echo '==> Installing Node.js and NPM'
sudo apt-get update
sudo apt install curl -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
apt install nodejs

echo '==> Extract api artifact to /var/promotions-manager-api'
mkdir $ARTIFACTS_PATH/drop
tar -xvf $ARTIFACTS_PATH/promotions-manager-api.*.tar.gz -C $ARTIFACTS_PATH/drop/
mkdir /var/promotions-manager-api/
tar -xvf $ARTIFACTS_PATH/drop/drop/promotions-manager-api.*.tar.gz -C /var/promotions-manager-api

echo '==> Set the DATABASE_HOST env var to be globally available'
DATABASE_HOST=$DATABASE_HOST.$DOMAIN_NAME
echo 'DATABASE_HOST='$DATABASE_HOST >> /etc/environment
echo 'RELEASE_NUMBER='$RELEASE_NUMBER >> /etc/environment
echo 'API_BUILD_NUMBER='$API_BUILD_NUMBER >> /etc/environment
echo 'API_PORT='$API_PORT >> /etc/environment
source /etc/environment

echo '==> Install PM2, it provides an easy way to manage and daemonize nodejs applications'
npm install -g pm2

echo '==> Start our api and configure as a daemon using pm2'
cd /var/promotions-manager-api
pm2 start /var/promotions-manager-api/index.js
pm2 save
chattr +i /root/.pm2/dump.pm2
sudo su -c "env PATH=$PATH:/home/unitech/.nvm/versions/node/v4.3/bin pm2 startup systemd -u root --hp /root"