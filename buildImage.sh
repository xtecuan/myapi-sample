#!/bin/ash
./mvnw clean package -DskipTests=true   -Dquarkus.container-image.build=true 
