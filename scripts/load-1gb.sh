#!/bin/bash
DB=db
USER=db
FILES_DIR=../data-sources/

set -e -x
docker exec -i pg-sandbox-db dropdb -U $USER --if-exists $DB
wget -c http://files.grouplens.org/datasets/movielens/ml-latest.zip -P $FILES_DIR
unzip -o "${FILES_DIR}ml-latest.zip"
docker exec -i pg-sandbox-db createdb -U $USER $DB
docker exec -i pg-sandbox-db psql -U $USER $DB < "${FILES_DIR}load-pgsql.sql"
docker exec -i pg-sandbox-db pg_dump -U $USER $DB > "${FILES_DIR}ml-latest.sql"

bash reset-stats.sh