#!/bin/bash

# block while api is running
while true
do
  RESULT=`ps -ef | grep index.js | grep -v grep`

  if [ "${RESULT:-null}" = null ]; then
    echo "not running"
    exit 1
  else
    echo "running"
  fi
  sleep 1
done
