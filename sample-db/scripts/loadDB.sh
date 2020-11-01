#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "revfa" < /docker-entrypoint-initdb.d/revfa.sql