#!/bin/ash

source ./env.sh


export CONTAINER=$CONTAINER
export IMAGE=$IMAGE


docker run  --privileged=true  --restart unless-stopped  -d  -p 80:80   --name $CONTAINER $IMAGE
   
