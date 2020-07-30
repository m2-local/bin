echo "Creating blank DB"
echo "create database ${docker_mysql_db};" | mysql -u "$docker_mysql_user" --password="$docker_mysql_pw" &>/dev/null