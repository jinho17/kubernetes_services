FILE = nginx
PORT = -p 80:80 -p 443:443 -p 22:22

SVC = grafana
IM = $(SVC)-image
SRC = srcs/$(SVC)
YAML = srcs/$(SVC).yaml

all:
	docker build -t $(FILE) srcs/$(FILE)

rund:
	docker run -d $(PORT) -e MYSQL_ROOT_PASSWORD=a1234 --name test $(FILE)

runi:
	docker run -it $(PORT) --name test $(FILE)

ex:
	docker exec -it test sh

log:
	docker logs test

stop:
	docker stop test

rm:
	docker rm test
	docker rmi $(FILE)

env:
	eval $(minikube docker-env)

start:
	docker build -t $(IM) $(SRC)
	kubectl apply -f $(YAML)

del:
	kubectl delete deployment $(SVC)-deployment
	kubectl delete service $(SVC)-service
