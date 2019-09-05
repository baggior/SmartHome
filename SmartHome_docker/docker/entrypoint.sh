#!/bin/bash

docker_image_name=pippo

echo "${docker_image_name} entrypoint2.sh..."

echo "${docker_image_name} starting influxdb service..."
service influxdb start

echo "${docker_image_name} starting grafana service..."
service grafana-server start

echo "${docker_image_name} calling openhab entrypoint.sh..."
/entrypoint.sh

# set -x
if [ $# -gt 0 ]
then
    echo "${docker_image_name} executing '$*'"
    exec $@
else
    echo "${docker_image_name} starting openhab service..."
    exec gosu openhab ./start.sh
fi
# set +x