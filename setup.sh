UserDir="/Users/$USER"

##minikube
#minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
#mv "$UserDir"/.minikube "$UserDir"/goinfre/minikube
#ln -sf "$UserDir"/goinfre/minikube $UserDir/.minikube

#external ip
EX_IP=$(minikube ip)
sed "s/EX_IP/$EX_IP/g" srcs/metallb.yaml > srcs/metallb_copy.yaml

#metallb namespace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#metallb configMap
kubectl apply -f srcs/metallb_copy.yaml
rm srcs/metallb_copy.yaml



#mysql password
#kubectl apply -f srcs/kustomization.yaml

#mysql
eval $(minikube docker-env)
docker build -t mysql-image srcs/mysql
#kubectl apply -f srcs/mysql.yaml

#nginx 디플로이먼트
eval $(minikube docker-env)
docker build -t nginx-image srcs/nginx
kubectl apply -f srcs/nginx.yaml

#php
eval $(minikube docker-env)
docker build -t php-image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin.yaml

#wordpress
eval $(minikube docker-env)
docker build -t wordpress-image srcs/wordpress
#kubectl apply -f srcs/wordpress.yaml

kubectl apply -k srcs/

###url
#minikube service nginx

###ssh test
#rm $HOME/.ssh/known_hosts
#ssh $(minikube ip) -p 22