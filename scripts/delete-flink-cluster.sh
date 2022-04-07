#!/bin/bash

set -e

kubectl delete -f k8s/taskmanager-job-deployment.yaml

kubectl delete -f k8s/jobmanager-application-non-ha.yaml

kubectl delete -f k8s/jobmanager-rest-service.yaml

kubectl delete -f k8s/jobmanager-service.yaml

kubectl delete -f k8s/flink-configuration-configmap.yaml
