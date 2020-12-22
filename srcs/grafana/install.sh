wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
tar -zxvf grafana-6.6.0.linux-amd64.tar.gz
apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

cp /tmp/datasources.yaml /grafana-6.6.0/conf/provisioning/datasources/datasources.yaml
cp /tmp/dashboards.yaml /grafana-6.6.0/conf/provisioning/dashboards/dashboards.yaml
cp /tmp/dashboard/* /grafana-6.6.0/public/dashboards/
rm -rf /grafana-6.6.0/public/dashboards/default.json
rm -rf /grafana-6.6.0/public/dashboards/template_vars.json

echo @@grafana start@@
cd ./grafana-6.6.0/bin/ && ./grafana-server
