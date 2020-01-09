#!/bin/sh

eval $(minikube docker-env)
docker build -t custom-nginx:1.1 srcs/nginx

if [ "$1" = "delete" ]
then
    kubectl delete -k srcs
else
    kubectl apply -k srcs
fi
