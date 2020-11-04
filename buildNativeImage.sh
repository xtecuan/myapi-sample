#!/bin/ash

#./mvnw package -Pnative -Dquarkus.native.container-build=true
#docker build -f src/main/docker/Dockerfile.native -t quarkus/myapi-sample .

./mvnw package -Pnative -Dquarkus.native.container-build=true -Dquarkus.container-image.build=true
