#!/usr/bin/env bash

echo "****************************************************************"
echo "Starting Rails Server"
echo "****************************************************************"

cd /home/artifacts/sample_rails_source/website || exit
rails server --binding=localhost
