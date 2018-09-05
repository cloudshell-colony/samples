#!/usr/bin/env bash


echo "****************************************************************"
echo "For Debugging (print env. variables, define command tracing)"
echo "****************************************************************"
#set -o xtrace
#env
#set

# Update packages and Upgrade system
echo "****************************************************************"
echo "Updating System"
echo "****************************************************************"
apt-get update -y


echo "****************************************************************"
echo "Installing Apache"
echo "****************************************************************"
apt-get install apache2 apache2-utils -y
service apache2 start


echo "****************************************************************"
echo "Installing PHP Modules"
echo "****************************************************************"
apt-get install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd -y



echo "****************************************************************"
echo "Installing Wordpress"
echo "****************************************************************"
wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cp -r wordpress/. /var/www/html
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
rm /var/www/html/index.html


echo "****************************************************************"
echo "Configuring database access"
echo "****************************************************************"
cd /var/www/html || exit
mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
sed -i "s/username_here/$DB_USER/g" wp-config.php
sed -i "s/password_here/$DB_PASS/g" wp-config.php
sed -i "s/localhost/mysql.$DOMAIN_NAME/g" wp-config.php

service apache2 restart



