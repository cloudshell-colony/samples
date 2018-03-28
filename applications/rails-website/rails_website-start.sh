#!/bin/bash

echo "****************************************************************"
echo "Starting Rails Server"
echo "****************************************************************"

cd /home/ubuntu/wwwroot
rails server --binding=localhost
