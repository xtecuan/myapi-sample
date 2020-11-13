#!/bin/ash

source ./env.sh


export CONTAINER=$CONTAINER
export IMAGE=$IMAGE


docker run  --privileged=true  --restart unless-stopped  -d --name $CONTAINER $IMAGE
   