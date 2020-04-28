#according to 


#Minikube is a tool that makes it easy to run Kubernetes locally.
#Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.
#kubernetes pod:- group of containers deployed together on the same host
#pods group containers doing similar tasks or containers which need to run alongside each other
#kubectl is used the manage what the node (or set of containers) are doing

#to check if kubernetes installed
    minikube version

#starting a cluster
    minikube start

#to obtain IP address to access pods on local machine
    minikube ip
    
#to use view deployment in browser after deployment is created
    minikube service <cluster alias > --url

#to enable dashboard
    minikube addons enable dashboard
#to view dashboard of all the kubernetes clusters
    minikube dashboard
#watch pod dashboard within system
kubectl get pods -n kubernetes-dashboard -w 

#to connect to the docker containers in cluster
     eval $(minikube docker-env)
    #this configures only the crrent working terminal window


#kubernetes uses lable selectors to link pods together
#lables are key value pairs <lable name>:<name>
#in yml if

metadata:
    selectors:
        lable: 
            <lable name>:<name>

#in yml file useing it
    selector:
        <lable name>: <name> 

#Note: start minikube before executing any command

#kubernetes-CLI
    kubectl

#to check the health of the clusters
    kubectl cluster-info   

#feed a config file to kubectl
kubectl apply -f <path to config file name>
#apply: helps in changing the current config to our own

#feeding a group o config files
    kubectl apply -f <folder name>

#to view the nodes/deployments/pods in the cluster
    kubectl get nodes|deployments|pods|service

#to delete node/deployment/pods
    kubectl delete node|pod|deployment <alias>

#to delete services
    kubectl delete service <alias>

#to delete a object 
    kubectl delete -f <config file>

#to get persistant volumes
    kubectl get pv

#to get all the volume claims
    kubectl get pvc

#to delete everything including cache docker images 
    docker system prune -a 
    #run command after configuring docoker to minikube 

#deploying containers into kubernetes
    kubectl run <cluster alias > --image=<docker image name> --port=<port>

#to use pods a service has to be created
    kubectl expose deployment <cluster alias > --type=<type> --port = <port no>
    #type parameter
    #    LoadBalancer
    #     NodePort

#to create secret to assign passwords keys etc
    kubctl create secret <type of secret> <secret name | alias> --from-literal <key name> = <password value>

    # type of secret: 
    #     genric: most used
    #     tls: http certificate 
    #     docker-registry: custom private docker images
# this is being done on local machine needs to be done again when in production

#to get secret
    kubctl get secret

#providing dynamic ports to containers
    kubectl expose development <cluster alias > -p=<port> --type = NodePort #Nodeport allows for dynamic port allocation

#get details about a specific object 
kubectl describe <object type> <object name> #gives info about <object name>
kubectl describe <object type> #gives info about all the <object names> present in <object type>
#eg: kubectl describe pod podName1

#Imperative command to update deployment when image is updated
#the version number must be specified in the docker image 

kubectl set image <kind type> / <object name> <container name> = <image>:<new version number>
#kind:
    #-pod
    #-deployment
    #-services
#container name:
    #found in template > spec > container > name

#eg kubectl set image deployment/client-deployment client= stephengrider/multi-client:v3

#logs of a certain pod
    kubectl logs <pods name>
#connecting to shell of a certain pods
    kubectl exec -it <pod name>

# HEML is used to administor 3rd party software in our kubernetes cluster. Used install additional services 
# tiller is the serverused to serve the application
# heml cli - client
# tiller - server
# helm files
#     Chart.yml - stores metadata about application. and version
#     values.yml - stores default configuration
#     requriments.yml - stores the dependencies
#     charts/ (dir)- pakages are stores
#     templates/ (dir)- where source templates are stores and are fed into the heml templating engine 
#     _helpers - stores functions 


#creating cluster service account
    kubectl create serviceaccount --namespace kube-system tiller
#creating service account cluster binding
    kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

#init heml
    helm init --service-account tiller --upgrade
#installing nginx when rbac is created
    helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
#Creating the helm charts
    helm create <folder name>
    # the command creates an folder named <folder name>
    #Charts/ 
    #templates/_helper.tpl
    #chart.yml
    #values.yml
    #delete the rest

#to add dependencies add a requirements.yml file in the root of <folder name>