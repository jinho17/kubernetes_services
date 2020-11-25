apk update
apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip  php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd  php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-memcache  php7-iconv php7-pdo_dblib php7-curl php7-ctype

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin
mkdir -p /var/www/html
ln -s /usr/share/phpMyAdmin /var/www/html/phpMyAdmin
mv /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php

