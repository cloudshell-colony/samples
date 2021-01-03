#!/bin/bash

# save all env for debugging
printenv > /var/log/colony-vars-"$(basename "$BASH_SOURCE" .sh)".txt

echo 'Extracting user data db artifact'
mkdir $ARTIFACTS_PATH/drop
tar -xvf $ARTIFACTS_PATH/*.* -C $ARTIFACTS_PATH/drop/