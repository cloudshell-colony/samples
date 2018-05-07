#!/bin/bash

echo "****************************************************************"
echo "Starting Rails Server"
echo "****************************************************************"

cd /home/ubuntu/wwwroot || exit
rails server --binding=localhost
