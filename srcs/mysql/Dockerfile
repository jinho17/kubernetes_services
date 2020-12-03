FROM alpine

COPY install.sh /tmp/install.sh
COPY mysql_set.sql /tmp/mysql_set.sql
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
ENTRYPOINT sh /tmp/install.sh