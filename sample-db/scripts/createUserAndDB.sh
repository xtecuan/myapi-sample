#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER sample WITH PASSWORD 'Welcome123$';
	CREATE DATABASE sample WITH OWNER sample ENCODING 'UTF8' TEMPLATE template0;
	GRANT ALL PRIVILEGES ON DATABASE sample TO sample;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "sample" < /sql/tables.sql
