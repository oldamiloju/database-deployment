#!/bin/bash
set -e
psql -U postgres -d mydb -c "CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator_password';"
echo "host replication replicator 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
