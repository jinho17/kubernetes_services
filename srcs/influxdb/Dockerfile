FROM alpine

RUN apk update
RUN apk add influxdb --no-cache

EXPOSE 8086
ENTRYPOINT ["influxd", "run", "-config", "/etc/influxdb.conf"]