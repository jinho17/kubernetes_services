FROM alpine

COPY install.sh /tmp/install.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.inc.php /tmp/config.inc.php

EXPOSE 5000 80
ENTRYPOINT sh /tmp/install.sh