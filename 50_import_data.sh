#!/bin/bash

set -e

wget $POSTGRES_TRANSFERSTRUKTUR_URL -O /var/lib/postgresql/transferstruktur.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_APP /var/lib/postgresql/transferstruktur.dump

wget $POSTGRES_APPSCHEMA_URL -O /var/lib/postgresql/appschema.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_APP /var/lib/postgresql/appschema.dump

wget $POSTGRES_LOGSCHEMA_URL -O /var/lib/postgresql/logschema.dump
pg_restore -v -U "$POSTGRES_USER" -d $POSTGRES_DATABASE_LOG /var/lib/postgresql/logschema.dump