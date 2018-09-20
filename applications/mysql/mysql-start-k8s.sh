#!/usr/bin/env bash

echo "****************************************************************"
echo "Restarting MYSQL"
echo "****************************************************************"
service mysql restart
while ps -p "$(pgrep mysql)" > /dev/null ; do sleep 1; done;
