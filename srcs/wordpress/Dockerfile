FROM alpine

COPY install.sh /tmp/install.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY wp-config.php /tmp/wp-config.php

EXPOSE 5050
ENTRYPOINT sh ./tmp/install.sh