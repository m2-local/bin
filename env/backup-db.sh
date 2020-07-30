#!/bin/bash
mysqldump -u "$docker_mysql_user" --password="$docker_mysql_pw" "$docker_mysql_db" | gzip > "$docker_sata_mount/exports/local-bkup-$(date +"%m-%d-%Y").sql.gz"