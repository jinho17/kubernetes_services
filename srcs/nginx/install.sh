apk update
apk add nginx openssl openssh
mkdir -p /var/run/nginx

#ssl
mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
chmod 600 etc/nginx/ssl/localhost.crt etc/nginx/ssl/localhost.key

#ssh
adduser -D jinkim
echo jinkim:a1234 | chpasswd
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N ""
/usr/sbin/sshd

##nginx start
nginx -g 'daemon off;'