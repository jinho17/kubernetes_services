mkdir -p /run/mysqld

apk update
apk add mysql mysql-client

mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
mysqld --user=root --bootstrap < /tmp/mysql_set.sql

mysqld --user=root