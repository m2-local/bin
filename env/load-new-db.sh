#!/bin/bash
# import a db w/ filename presumed to be relative to the $dkr_sata_mount/exports directory
echo "Dropping DB & Creating blank DB"
echo "drop database ${dkr_mysql_db}; create database ${dkr_mysql_db};" | mysql -u "$dkr_mysql_user" --password="$dkr_mysql_pw"

db_file="$1"
db_path=
if [ "$db_file" == "load-new-db.sh" ]; then
    db_file="$2"
    db_path="${dkr_sata_mount}/exports/$db_file"
fi

if [ ! -f "$db_path" ]; then
    echo "Path to new DB file ${db_path} DNE - bailing"
    exit 2
fi

echo "Loading new database $db_file"
mysql -u "$dkr_mysql_user" --password="$dkr_mysql_pw" "$dkr_mysql_db" < "$db_path"

echo "Running post db import script"
. $(dirname "$0")/post-db-import.sh

echo "Running full rebuild script"
. $(dirname "$0")/full-rebuild-dev.sh