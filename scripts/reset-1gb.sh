#!/bin/sh
DB=db
USER=db
set -e -x
docker exec -i pg-sandbox-db dropdb -U $USER --if-exists $DB
docker exec -i pg-sandbox-db createdb -U $USER $DB
docker exec -i pg-sandbox-db bash -c "psql -U ${USER} ${DB} < /data-sources/ml-latest.sql"
bash reset-stats.sh