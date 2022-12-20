#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE geodb_ua;
    ALTER ROLE geodb_ua WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD '$POSTGRES_GEODB_UA_PASSWORD' VALID UNTIL 'infinity';
    CREATE ROLE oereb;
    ALTER ROLE oereb WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD '$POSTGRES_OEREB_PASSWORD' VALID UNTIL 'infinity';
    CREATE ROLE oereb_viewer;
    ALTER ROLE oereb_viewer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
    CREATE ROLE geodb_viewer;
    ALTER ROLE geodb_viewer WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
    CREATE ROLE tuoerebserver;
    ALTER ROLE tuoerebserver WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD '$OEREB_SERVER_POSTGRES_PASSWORD';
    GRANT oereb_viewer to tuoerebserver;
    CREATE ROLE tuoereb;
    ALTER ROLE tuoereb WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD '$POSTGRES_TUOEREB_PASSWORD';
EOSQL