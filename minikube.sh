minikube start --vm-driver=virtualbox --cpus 3 --disk-size=30000mb --memory=3000mb
minikube addons enable metrics-server
minikube addons enable ingress
