FROM postgis/postgis:12-3.0-alpine

WORKDIR /docker-entrypoint-initdb.d

COPY 20_roles_oereb.sh /docker-entrypoint-initdb.d/
COPY 30_createdb.sh /docker-entrypoint-initdb.d/30_createdb.sh
COPY 40_createextension.sh /docker-entrypoint-initdb.d/40_createextension.sh
COPY 50_import_data.sh /docker-entrypoint-initdb.d/50_import_data.sh