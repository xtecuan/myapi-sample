#!/bin/ash

export PORT=443
export PASS="Welcome123\$"
export CONTAINER="myapi-container-dev"
export IMAGE="xtecuan/myapi-sample:1.0.0-SNAPSHOT"

docker run  --restart unless-stopped  -d \
    --name $CONTAINER \
    -p $PORT:8443 \
    $IMAGE
