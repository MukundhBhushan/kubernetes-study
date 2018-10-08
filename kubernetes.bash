#according to


#Minikube is a tool that makes it easy to run Kubernetes locally.
#Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

#to check if kubernetes installed
    minikube version

#starting a cluster
    minikube start


#kubernetes-CLI
    kubectl

#to check the health of the clusters
    kubectl cluster-info   

#to view the nodes in the cluster
    kubectl get nodes

#deploying containers into kubernetes
    kubectl run <cluster alias > --image=<docker image name> --port=<port>

#status of the pods
kubectl get pods

#providing dynamic ports to containers
    kubectl expose development <cluster alias > -p=<port> --type = NodePort #Nodeport allows for dynamic port allocation
    