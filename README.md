# Setup helm

    helm init
  
# BinderHub

    helm install stable/docker-registry --name=binder-docker-registry --namespace=binder -f k8s-manifests/docker-registry-values.yaml 
    helm install jupyterhub/binderhub --version=0.2.0-3b53fce  --name=binderhub --namespace=binder -f k8s-manifests/binderhub-values.yaml
  
  
# JupyterHub

Setup for jupyterhub installation

    helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
    helm repo update
 
Install jupyterhub
   
    helm install --name jupyterhub jupyterhub/jupyterhub --values k8s-manifests/jupyterhub-values.yaml --version 0.8.2 --timeout=300

 
# Minio

Start minio on kubernetes 

    helm install --name minio --values k8s-manifests/minio-values.yaml stable/minio
  
Forward minio port

    export POD_NAME=$(kubectl get pods --namespace default -l "release=minio" -o jsonpath="{.items[0].metadata.name}")
    kubectl port-forward $POD_NAME 9000 --namespace default
    
Configure mc client

    mc config host add local http://localhost:9000 minio minio123 --api "s3v4" --lookup "dns"

# Commuter

Create docker image, to access it from minikube `eval $(docker-machine env -u)` 

    docker build -t commuter:last . -f commuter/Dockerfile
    
Start commuter on kubernetes

    kubectl apply -f k8s-manifests/commuter.yaml

# Build xebicon jupyter image

Build image

    cd xebicon-notebook && docker build -t xebicon19_velib .