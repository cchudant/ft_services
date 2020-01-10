#!/bin/sh

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
