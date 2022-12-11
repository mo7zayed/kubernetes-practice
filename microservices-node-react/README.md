# Microservices Kubernates (Node & React)

This repository is for learning purposes

### Installation

- Docker should be installed on your machine if not just run `curl https://get.docker.com | sh`
- Install [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) installed on your machine
- Install [minikube](https://kubernetes.io/docs/tasks/tools/#minikube)
- Run `minikube start` to start your cluster
- Run `sh up.sh` to apply the deployments and services to your cluster and `sh down.sh` to remove the project from the cluster
- `minikube service frontend-service` then open the url

### Architecture

![Architecture](./architecture.png)
