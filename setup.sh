#!/bin/sh

if ! which docker >/dev/null 2>&1 ||
    ! which minikube >/dev/null 2>&1;
then
    echo Please install Docker and Minikube
    exit 1
fi

if ! minikube status >/dev/null 2>&1
then
    echo Minikube is not started! Starting now...
    if ! minikube start --vm-driver=virtualbox \
        --cpus 3 --disk-size=30000mb --memory=3000mb
    then
        echo Cannot start minikube!
        exit 1
    fi
    minikube addons enable metrics-server
    minikube addons enable ingress
fi

eval $(minikube docker-env)
docker build -t custom-nginx:1.11 srcs/nginx
docker build -t custom-ftps:1.2 srcs/ftps
docker build -t custom-wordpress:1.7 srcs/wordpress
docker build -t custom-phpmyadmin:1.1 srcs/phpmyadmin

if [ "$1" = "delete" ]
then
    kubectl delete -k srcs
else
    kubectl apply -k srcs
fi
