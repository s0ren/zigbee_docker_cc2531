#!/bin/bash
start=`date +%s`
echo "Running restart..."

docker-compose --compatibility down && docker-compose --compatibility up -d
docker-compose ps

end=`date +%s`
echo -e "\nScript has reached its end after: " $((end-start)) " seconds"

