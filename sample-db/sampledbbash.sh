#!/bin/ash
source ./env.sh
export DOCKER_SHARES=/home/xtecuan/Projects/docker_shares
export PGDATA=$DOCKER_SHARES/pgdata
export PORT=5432
export PASS="Welcome123\$"
export CONTAINER=$CONTAINER

docker exec -it $CONTAINER  bash
