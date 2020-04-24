#!/bin/sh
DB=db
USER=db

docker exec -i pg-sandbox-db psql $DB $USER << EOF
    CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
    SELECT pg_stat_statements_reset();
EOF
