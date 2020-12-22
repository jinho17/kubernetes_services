apk update
apk add openssl vsftpd

mkdir -p /var/ftp/jinkim
adduser --home=/var/ftp/jinkim -D jinkim
echo "jinkim:a1234" | chpasswd
echo "jinkim" >> etc/vsftpd/vsftpd.userlist
chown jinkim.jinkim /var/ftp/jinkim

mkdir -p /etc/vsftpd/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /etc/vsftpd/ssl/server.key -out /etc/vsftpd/ssl/server.crt
chmod 755 /etc/vsftpd/ssl/server.key
chmod 755 /etc/vsftpd/ssl/server.crt 

echo ftp server start!
vsftpd /etc/vsftpd/vsftpd.conf