#!/bin/sh

# Ensure docker and minikube are installed
if ! which docker >/dev/null 2>&1 ||
    ! which minikube >/dev/null 2>&1
then
    echo Please install Docker and Minikube
    exit 1
fi

# Ensure minikube is launched
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

# Building images
MINIKUBE_IP=$(minikube ip)

cp srcs/ftps/entrypoint srcs/ftps/entrypoint-target
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/ftps/entrypoint-target
cp srcs/wordpress/wordpress_dump.sql srcs/wordpress/wordpress_dump-target.sql
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/wordpress/wordpress_dump-target.sql

eval $(minikube docker-env)
docker build -t custom-nginx:1.11 srcs/nginx
docker build -t custom-ftps:1.6 srcs/ftps
docker build -t custom-wordpress:1.9 srcs/wordpress
docker build -t custom-phpmyadmin:1.1 srcs/phpmyadmin
docker build -t custom-grafana:1.0 srcs/grafana
docker build -t custom-mysql:1.11 srcs/mysql

# Apply yaml files
if [ "$1" = "delete" ]
then
    kubectl delete -k srcs
else
    kubectl apply -k srcs
fi
