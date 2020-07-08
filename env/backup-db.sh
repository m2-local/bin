#!/bin/bash
mysqldump -u "$dkr_mysql_user" --password="$dkr_mysql_pw" "$dkr_mysql_db" | gzip > "$dkr_sata_mount/exports/local-bkup-$(date +"%m-%d-%Y").sql.gz"