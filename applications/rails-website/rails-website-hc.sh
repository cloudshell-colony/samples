#!/bin/bash

ip=$1
port=3000
hostname=${ip}:${port}

for (( ; ; ))
do
    sleep 1
    if [[ $(wget -S -T1 -t1 http://${hostname}/swagger/ 2>&1 | grep "HTTP/" | awk '{print $2}') == "200" ]] ; then
        echo 'connected to' ${hostname}
        exit 0
    else
        echo 'cannot connect to' ${hostname}
    fi
done
exit 1
