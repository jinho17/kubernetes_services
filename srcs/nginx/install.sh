apk update
apk add nginx openssl openssh
mkdir -p /var/run/nginx

mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
chmod 600 etc/nginx/ssl/localhost.crt etc/nginx/ssl/localhost.key

# /usr/sbin/sshd
nginx -g 'daemon off;'