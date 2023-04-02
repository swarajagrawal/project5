#!/usr/bin/env bash

# Deploy the image to the Kubernetes EKS cluster

# Step 1:
# Check if the Kubernetes cluster is ready
kubectl get nodes

# Step 2
# Deploy an app from the AWS ECR repository to the Kubernetes cluster
kubectl create deploy project-ml-microservice-kubernetes --image=647868873944.dkr.ecr.us-west-2.amazonaws.com/project-ml-microservice-kubernetes:latest

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
#kubectl port-forward pod/python-helloworld-84857d9565-2598m --address 0.0.0.0 80:80
kubectl port-forward deployment/project-ml-microservice-kubernetes 8000:80
