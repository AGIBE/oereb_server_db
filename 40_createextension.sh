#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname $POSTGRES_DATABASE_APP <<-EOSQL
    CREATE EXTENSION postgis;
    CREATE EXTENSION pgcrypto;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname $POSTGRES_DATABASE_LOG <<-EOSQL
    CREATE EXTENSION postgis;
    CREATE EXTENSION pgcrypto;
EOSQL