#!/usr/bin/env bash
# This file tags and uploads an image to AWS Elastic Container Registry

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Retrieve an authentication token and authenticate your Docker client to your registr
dockerpath="swarajagrawal/myrepo"
#aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 105062491232.dkr.ecr.us-west-2.amazonaws.com

# Step 2:  
# Tagging the image so that it can be pushed to the repository
docker login -u $DOCKER_LOGIN -p $DOCKER_PASSWORD
#docker tag capstoneproject:latest 105062491232.dkr.ecr.us-west-2.amazonaws.com/capstoneproject:latest

# Step 3:
# Push this image to your newly created AWS repository
#docker push 105062491232.dkr.ecr.us-west-2.amazonaws.com/capstoneproject:latest
docker tag capstoneproject $dockerpath
echo "Docker ID and Image: $dockerpath"

docker push $dockerpath