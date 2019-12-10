#!/bin/sh

if [ "$1" = "delete" ]
then
    kubectl delete -k srcs
else
    kubectl apply -k srcs
fi
