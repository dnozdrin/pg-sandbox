#!/bin/bash
DB=movielens
USER=db
set -e -x
dropdb -U $USER --if-exists $DB
wget -c http://files.grouplens.org/datasets/movielens/ml-latest.zip
unzip -o ml-latest.zip
createdb -U $USER $DB
psql -U $USER $DB < load-pgsql.sql
pg_dump -U $USER $DB > ml-latest.sql
