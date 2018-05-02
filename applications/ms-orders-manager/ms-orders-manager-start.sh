!/bin/bash
echo "****************************************************************"
echo "Starting the node application"
echo "****************************************************************"


cd /home/artifacts/sample_micro_services_nodejs_source/order-service


node app.js ms-payments-service.$DOMAIN_NAME:3001 ms-data-store.$DOMAIN_NAME:3004;  # Connecting to the other services by sending the DNS names as arguments