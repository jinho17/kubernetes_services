FROM alpine

COPY install.sh /tmp/install.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21 40000
ENTRYPOINT sh /tmp/install.sh