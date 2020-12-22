mkdir -p /run/mysqld

apk update
apk add mysql mysql-client

mysql_install_db --user=root
echo @mysql_set.sql setting@
mysqld --user=root --bootstrap < /tmp/mysql_set.sql
echo @mysqld start@
mysqld --user=root