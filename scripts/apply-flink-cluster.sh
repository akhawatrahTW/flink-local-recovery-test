#!/bin/bash

set -e

kubectl apply -f k8s/flink-configuration-configmap.yaml

kubectl apply -f k8s/jobmanager-service.yaml

kubectl apply -f k8s/jobmanager-rest-service.yaml

kubectl apply -f k8s/jobmanager-application-non-ha.yaml

kubectl apply -f k8s/taskmanager-job-deployment.yaml
