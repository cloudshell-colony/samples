#!/usr/bin/env bash

echo "****************************************************************"
echo "Restarting Apache"
echo "****************************************************************"
service apache2 restart
while ps -p "$(pgrep apache2)" > /dev/null ; do sleep 1; done;