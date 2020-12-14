FROM alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY install.sh /tmp/install.sh
COPY sshd_config /etc/ssh/sshd_config

EXPOSE 80 443 22
ENTRYPOINT sh /tmp/install.sh