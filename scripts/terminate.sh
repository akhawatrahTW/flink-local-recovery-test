#!/bin/bash

set -e

scripts/delete-minio-cluster.sh

scripts/delete-flink-cluster.sh

minikube stop

eval $(minikube docker-env -u)
