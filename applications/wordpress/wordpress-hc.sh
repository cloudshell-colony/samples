#!/bin/bash

ip=$1
port=80
hostname=${ip}:${port}

until timeout 1 bash -c "</dev/tcp/$ip/$port"; [[ "$?" -eq "0" ]];
  do sleep 1;
done;
echo 'connected to' "$hostname"
