echo "Creating blank DB"
echo "create database ${dkr_mysql_db};" | mysql -u "$dkr_mysql_user" --password="$dkr_mysql_pw"