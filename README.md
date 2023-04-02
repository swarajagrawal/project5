[![CircleCI](https://dl.circleci.com/status-badge/img/gh/swarajagrawal/project-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/swarajagrawal/project-ml-microservice-kubernetes/tree/main)

**Project Overview**

The project is a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on the data source site. We need to operationalize a Python flask app—in a provided file, app.py—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

**Project Tasks**

Our project goal is to operationalize this working, machine learning microservice using kubernetes, which is an open-source system for automating the management of containerized applications. In this project you will:

Test your project code using linting
Complete a Dockerfile to containerize this application
Deploy your containerized application using Docker and make a prediction
Improve the log statements in the source code for this application
Configure Kubernetes and create a Kubernetes cluster
Deploy a container using Kubernetes and make a prediction
Upload a complete Github repo with CircleCI to indicate that your code has been tested
Setup the Environment
Create a virtualenv and activate it
Run make install to install the necessary dependencies
Running app.py
Standalone: python app.py
Run in Docker: ./run_docker.sh
Run in Kubernetes: ./run_kubernetes.sh


Kubernetes Steps

Setup and Configure Docker locally: Install docker for mac. It will install Docker desktop , Kubernetes and kubectl by default. [https://www.docker.com ]

Building docker image docker build -t ml-kubermnetes .  To List the images created docker image ls To start the docker image docker run -p 8080:80 ml-kubermnetes
Add all the above command in a file run_docker.sh

Setup and Configure Kubernetes locally: Install kubectl and minikube. Start minikube: minikube start. Verify cluster: kubectl config view.

Create Flask app in Container: Create a Docker file with workign directory WORKDIR /app Copy COPY . app.py /app/ to container. Install the dependencies. RUN pip install --upgrade pip &&\ pip install --trusted-host pypi.python.org -r requirements.txt Build the docker image, list docker images created and run the containerized Flask app by calling script: ./run_docker.sh. Make a prediction: Open a separate tab and call script: ./make_prediction.sh.

Run via kubectl: Run the containerized application by calling script: ./run_kubernetes.sh. (Check pod status by executing kubectl get pod and rerun run_kubernetes.sh script when status changes from ContainerCreating to Running). Make a prediction: Open a separate tab and call script: ./make_prediction.sh.

Delete the Kubernetes cluster: minikube delete (Or pause by running minikube stop).

**Description of the files used in this project**

app.py - A Flask app created usign python to predict Boston Housing prices.
requirements.txt - All the required packages to run the application sucessfully.
Makefile - steps and commands used to install dependencies including pylint for application and hadolint for Docker file.
Dockerfile - Contains the command to create and build a Docker Image.
make_prediction.sh - Sample data passed to the API to geta prediction.
run_docker.sh - The shell script includes steps to build , list and run containers.
upload_docker.sh : This includes commands to define dockerpath, authenticate and tag image and push the docker image to the docker path (in the docker hub)
run_kubernetes.sh : This includes commands to run the deployed docker image in a kubernetes cluster
/output_txt_files - Folder contains the output logs of the Docker and Kubernetes.
/.circleci/config.yml - Configuration file created to run CI build which includes the steps , installing dependencies.
