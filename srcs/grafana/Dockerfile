FROM alpine

COPY install.sh /tmp/install.sh
COPY datasources.yaml /tmp/datasources.yaml
COPY dashboards.yaml /tmp/dashboards.yaml
COPY dashboard /tmp/dashboard

EXPOSE 3000
ENTRYPOINT sh /tmp/install.sh