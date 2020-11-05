#!/bin/ash

#NFS SHARE
export NFS_VOL_NAME=mypgdata 
export NFS_LOCAL_MNT=/var/lib/postgresql/data/pgdata 
export NFS_SERVER="192.168.0.100" 
export NFS_SHARE=/pgdata 
export NFS_OPTS=vers=3,soft

docker  volume create --driver local \
  --opt type=nfs --opt o=addr=$NFS_SERVER,$NFS_OPTS \
  --opt device=:$NFS_SHARE $NFS_VOL_NAME



