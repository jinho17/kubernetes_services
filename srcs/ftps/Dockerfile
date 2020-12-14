FROM alpine

COPY install.sh /tmp/install.sh
#COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 40000-40010 21000
ENTRYPOINT sh /tmp/install.sh