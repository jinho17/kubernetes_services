UserDir="/Users/$USER"

##minikube
minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000 \
          --addons=default-storageclass --addons=metallb --addons=storage-provisioner --addons=dashboard --addons=metrics-server
mv "$UserDir"/.minikube "$UserDir"/goinfre/minikube
ln -sf "$UserDir"/goinfre/minikube $UserDir/.minikube

#metallb namespace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#metallb configMap
kubectl apply -f srcs/metallb.yaml

#mysql
eval $(minikube docker-env)
docker build -t mysql-image srcs/mysql
#kubectl apply -f srcs/mysql.yaml

#nginx 디플로이먼트
docker build -t nginx-image srcs/nginx
kubectl apply -f srcs/nginx.yaml

#php
docker build -t php-image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin.yaml

#wordpress
docker build -t wordpress-image srcs/wordpress
#kubectl apply -f srcs/wordpress.yaml

kubectl apply -k srcs/

#ftps
docker build -t ftps-image srcs/ftps
kubectl apply -f srcs/ftps.yaml


kubectl create secret generic influxdb-secret \
  --from-literal=INFLUXDB_DB=telegraf \
  --from-literal=INFLUXDB_USER=jinkim \
  --from-literal=INFLUXDB_USER_PASSWORD=a1234 \
  --from-literal=INFLUXDB_HOST=influxdb-service \
  --from-literal=INFLUXDB_HTTP_AUTH_ENABLED=false
kubectl create secret generic grafana-secret \
  --from-literal=GF_SECURITY_ADMIN_USER=jinkim \
  --from-literal=GF_SECURITY_ADMIN_PASSWORD=a1234

#influxdb
docker build -t influxdb-image srcs/influxdb
kubectl apply -f srcs/influxdb.yaml
#telegraf
docker build -t telegraf-image srcs/telegraf
kubectl apply -f srcs/telegraf.yaml
#grafana
docker build -t grafana-image srcs/grafana
kubectl apply -f srcs/grafana.yaml

minikube dashboard

###ssh test
#rm $HOME/.ssh/known_hosts
#ssh $(minikube ip) -p 22

###ftp test
#ftp $(minikube ip)
