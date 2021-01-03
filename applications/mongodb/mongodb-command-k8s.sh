#!/bin/bash

# run original start command in background
echo 'Run original start command in background'
cd /usr/local/bin/
./docker-entrypoint.sh --bind_ip_all &

echo 'Wait for db to be ready'
sleep 30

echo 'Import all collections from artifact'
cd $ARTIFACTS_PATH/drop
for f in ./*.json; do
	temp_var="${f%.*}"
	collection="${temp_var:2}"
	mongoimport --db promo-manager --collection $collection --file $ARTIFACTS_PATH/drop/$f
done

# block while api is running
while true
do
  RESULT=`ps -ef | grep "mongod --bind_ip_all" | grep -v grep`

  if [ "${RESULT:-null}" = null ]; then
    echo "not running"
    exit 1
  else
    echo "running"
  fi
  sleep 1
done
