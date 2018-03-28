#!/bin/bash

ip=$1
port=3306
hostname=${ip}:${port}

until timeout 1 bash -c "</dev/tcp/$ip/$port"; [[ "$?" -eq "0" ]];
  echo 'waiting for mysql'
  do sleep 1;
done;
echo 'connected to' "$hostname"