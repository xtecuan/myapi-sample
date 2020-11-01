#!/bin/ash

source ./env.sh

export DOCKER_SHARES=/home/xtecuan/Projects/docker_shares
export PGDATA=$DOCKER_SHARES/data/pgdata
export PORT=5432
export PASS="Welcome123\$"
export CONTAINER=$CONTAINER
export IMAGE=$IMAGE

docker run  --restart unless-stopped  -d \
    --name $CONTAINER \
    -e POSTGRES_PASSWORD=$PASS \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $PGDATA:/var/lib/postgresql/data/pgdata \
    -p $PORT:5432 \
    $IMAGE
