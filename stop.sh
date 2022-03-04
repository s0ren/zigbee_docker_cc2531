#!/bin/bash
start=`date +%s`
echo "Running stop..."

docker-compose --compatibility down
docker-compose ps

end=`date +%s`
echo -e "\nScript has reached its end after: " $((end-start)) " seconds"

