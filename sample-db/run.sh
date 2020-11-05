#!/bin/ash

source ./env.sh

export DOCKER_SHARES=/opt/docker_shares
export PGDATA=$DOCKER_SHARES/data
export PORT=5432
export PASS="Welcome123\$"
export CONTAINER=$CONTAINER
export IMAGE=$IMAGE

#NFS SHARE
export NFS_VOL_NAME=mypgdata 
export NFS_LOCAL_MNT=/var/lib/postgresql/data/pgdata 
export NFS_SERVER="192.168.0.100" 
export NFS_SHARE=/pgdata 
export NFS_OPTS=vers=3,soft


docker run  --privileged=true  --restart unless-stopped  -d \
    --name $CONTAINER \
    -e POSTGRES_PASSWORD=$PASS \
    -e PGDATA=/var/lib/postgresql/data \
    -v $PGDATA:/var/lib/postgresql/data \
    -p $PORT:5432 \
    $IMAGE


#docker run  --privileged=true  --restart unless-stopped  -d \
# --name $CONTAINER \
# -e POSTGRES_PASSWORD=$PASS \
# -e PGDATA=/var/lib/postgresql/data/pgdata \
# -v $NFS_VOL_NAME:$NFS_LOCAL_MNT \
# -p $PORT:5432 \
# $IMAGE


#docker run  --privileged=true  --restart unless-stopped  -d  \
#--name $CONTAINER \
#-e POSTGRES_PASSWORD=$PASS \
#-e PGDATA=/var/lib/postgresql/data/pgdata \
#--mount "src=$NFS_VOL_NAME,dst=$NFS_LOCAL_MNT,volume-opt=device=:$NFS_SHARE,\"volume-opt=o=addr=$NFS_SERVER,$NFS_OPTS\",type=volume,volume-driver=local,volume-opt=type=nfs" \
#-p $PORT:5432 \
#$IMAGE


