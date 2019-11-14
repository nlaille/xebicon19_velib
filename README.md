# Setup kubernetes

## Setup helm

    helm init
    helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
    helm repo update
    
## Create namespace

    kubectl create namespace binderhub
    kubectl create namespace jupyterhub
    
## Install traefik

    helm install stable/traefik --name traefix --values k8s-manifests/traefik-values.yaml
  
# BinderHub

    helm install jupyterhub/binderhub --version=0.2.0-d2e3b8b --name=binderhub --namespace=binderhub -f k8s-manifests/binderhub-values.yaml
    kubectl apply -n binderhub -f k8s-manifests/binderhub-ingress.yaml

# Demo

## Jupyterhub
   
    helm install jupyterhub/jupyterhub --version 0.8.2 --name=jupyterhub --namespace=jupyterhub --values k8s-manifests/jupyterhub-values.yaml --timeout=300
    
## Minio

    helm install stable/minio --name minio --values k8s-manifests/minio-values.yaml 

## Commuter

    # Creata docker image
    docker build -t commuter:last . -f commuter/Dockerfile
    # Deploy commuter
    kubectl apply -f k8s-manifests/commuter.yaml

## Build jupyter image

    pushd jupyter-env && docker build -t jupyter-env:latest . && popd
    
# Add ingress hostname to /etc/hosts

    INGRESSES=$(kubectl --all-namespaces=true get ingress -o jsonpath='{.items[*].spec.rules[*].host}')
    echo "127.0.0.1 $INGRESSES" | sudo tee -a /etc/hosts
    # Still need proxy-public.. Find a way to remove proxy-public
    echo "127.0.0.1 proxy-public" | sudo tee -a /etc/hosts


