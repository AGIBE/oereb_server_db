#!/bin/bash

set -e

wget $OEREB_SERVER_DB_TRANSFERSTRUKTUR_URL -O transferstruktur.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_APP transferstruktur.dump

wget $OEREB_SERVER_DB_APPSCHEMA_URL -O appschema.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_APP appschema.dump

wget $OEREB_SERVER_DB_LOGSCHEMA_URL -O logschema.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_LOG logschema.dump