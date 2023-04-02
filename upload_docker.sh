#!/usr/bin/env bash
# This file tags and uploads an image to AWS Elastic Container Registry

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Retrieve an authentication token and authenticate your Docker client to your registry
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 647868873944.dkr.ecr.us-west-2.amazonaws.com

# Step 2:  
# Tagging the image so that it can be pushed to the repository
docker tag project-ml-microservice-kubernetes:latest 647868873944.dkr.ecr.us-west-2.amazonaws.com/project-ml-microservice-kubernetes:latest

# Step 3:
# Push this image to your newly created AWS repository
docker push 647868873944.dkr.ecr.us-west-2.amazonaws.com/project-ml-microservice-kubernetes:latest
