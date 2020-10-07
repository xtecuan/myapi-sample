#!/bin/bash


 ./mvnw clean compile -DskipTests=true -Dquarkus-profile=dev -Ddebug=5006 quarkus:dev
