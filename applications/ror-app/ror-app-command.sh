#!/bin/sh
echo "*****************************COMMAND ***********************************"
ruby bin/rails db:create
ruby bin/rails db:migrate
rails server --binding 0.0.0.0 --port 3000