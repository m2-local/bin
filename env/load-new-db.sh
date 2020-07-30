#!/bin/bash
# import a db w/ filename presumed to be relative to the $docker_sata_mount/exports directory
db_file="$2"
db_path="${docker_sata_mount}/exports/$db_file"
if [ ! -f "$db_path" ]; then
    echo "Path to new DB file ${db_path} DNE - bailing"
    exit 2
fi

echo "Dropping DB"
echo "drop database ${docker_mysql_db};" | mysql -u "$docker_mysql_user" --password="$docker_mysql_pw"
echo "Creating blank DB"
echo "create database ${docker_mysql_db};" | mysql -u "$docker_mysql_user" --password="$docker_mysql_pw"

echo "Loading new database $db_file"
mysql -u "$docker_mysql_user" --password="$docker_mysql_pw" "$docker_mysql_db" < "$db_path"

echo "Running post db import script"
. $(dirname "$0")/post-db-import.sh

echo "Running full rebuild script"
. $(dirname "$0")/full-rebuild-dev.sh