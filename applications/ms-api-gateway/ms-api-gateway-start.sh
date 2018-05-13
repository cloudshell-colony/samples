#!/usr/bin/env bash
echo "****************************************************************"
echo "Starting the node application"
echo "****************************************************************"
cd /home/artifacts/sample_micro_services_nodejs_source/api-gateway || exit

node app.js ms-payments-service."$DOMAIN_NAME":3001 ms-orders-manager."$DOMAIN_NAME":3002; # Connecting to the other services by sending the DNS names as arguments