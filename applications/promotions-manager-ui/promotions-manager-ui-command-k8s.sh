#!/bin/bash
echo 'Start nginx service'
service nginx stop
service nginx start

while true
do
  RESULT=`ps -ef | grep nginx | grep -v grep`

  if [ "${RESULT:-null}" = null ]; then
    echo "not running"
    exit 1
  else
    echo "running"
  fi
  sleep 1
done
