#!/bin/sh
echo "*****************************INIT SCRIPT ***********************************"
sed -i -e "s|redis_placeholder|$REDIS|g" /var/www/app/config/initializers/redis.rb
sed -i -e "s|postgres_placeholder|$POSTGRES|g" /var/www/app/config/database.yml
sed -i -e "s|postgres_username|$DB_USER|g" /var/www/app/config/database.yml
sed -i -e "s|postgres_password|$DB_PASS|g" /var/www/app/config/database.yml