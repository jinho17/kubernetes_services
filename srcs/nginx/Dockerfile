FROM alpine

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY install.sh /tmp/install.sh

EXPOSE 80 443 22
ENTRYPOINT sh /tmp/install.sh