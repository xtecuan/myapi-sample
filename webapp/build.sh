#!/bin/ash

source ./env.sh

docker build --force-rm=true --no-cache=true  -t=$IMAGE .
