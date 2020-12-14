apk update
apk add openssl vsftpd

adduser -D jinkim
echo jinkim:a1234 | chpasswd

mkdir -p /var/ftp
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /var/ftp/server.key -out /var/ftp/server.crt
chmod 400 /var/ftp/server.key
chmod 444 /var/ftp/server.crt 

#vsftpd /etc/vsftpd/vsftpd.conf
/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "MINIKUBE_IP"
