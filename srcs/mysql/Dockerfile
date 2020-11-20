FROM alpine

COPY srcs/install.sh /tmp/install.sh
COPY srcs/my.cnf /etc/mysql/my.cnf

#VOLUME /var/lib/mysql
RUN sh /tmp/install.sh
