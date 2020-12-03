apk update
apk add nginx openssl \
        php7 php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip  php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd  php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-memcache  php7-iconv php7-pdo_dblib php7-curl php7-ctype

#ssl
mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
chmod 600 etc/nginx/ssl/localhost.crt etc/nginx/ssl/localhost.key

#phpmyadmin
mkdir -p /var/lib/nginx/html
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /var/lib/nginx/html/phpmyadmin
mv /tmp/config.inc.php /var/lib/nginx/html/phpmyadmin/config.inc.php

php -S 0.0.0.0:5000 -t /var/lib/nginx/html/phpmyadmin
