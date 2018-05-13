#!/usr/bin/env bash
echo "****************************************************************"
echo "Starting Server"
echo "****************************************************************"
cd /home/artifacts/sample_micro_services_nodejs_source/payment-service || exit

node app.js ms-data-store."$DOMAIN_NAME":3004;    # Connecting to the other services by sending the DNS names as arguments