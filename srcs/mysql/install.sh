mkdir -p /run/mysqld

apk update
apk add mysql mysql-client

#adduser -D jinkim
#echo jinkim:a1234 | chpasswd

#chmod -R 755 /var/lib/mysql/
#chown -R root:root /var/lib/mysql/

mysql_install_db --user=root #--datadir="/var/lib/mysql"
echo mysql_set.sql setting!!!!
mysqld --user=root --bootstrap < /tmp/mysql_set.sql
echo mysql 시작!!!
echo 비밀번호 : 
echo $MYSQL_ROOT_PASSWORD
mysqld --user=root
echo 비밀번호 : 
echo $MYSQL_ROOT_PASSWORD