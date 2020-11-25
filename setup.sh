UserDir="/Users/$USER"

##minikube
minikube start --driver=virtualbox
mv "$UserDir"/.minikube "$UserDir"/goinfre/minikube
ln -sf "$UserDir"/goinfre/minikube $UserDir/.minikube

#external ip
EX_IP=$(minikube ip)

#metallb namespace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

#nginx 디플로이먼트
eval $(minikube docker-env)
docker build -t nginx-image srcs/nginx
kubectl apply -f srcs/nginx.yaml

#metallb configMap
kubectl apply -f srcs/metallb.yaml


#url
#minikube service nginx