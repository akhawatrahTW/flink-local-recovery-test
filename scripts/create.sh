#!/bin/bash

set -e

minikube start --cpus 4 --memory 8192 --disk-size 10GB

minikube ssh 'sudo ip link set docker0 promisc on'

eval $(minikube docker-env)

scripts/build-docker-image.sh

scripts/apply-minio-cluster.sh

scripts/apply-flink-cluster.sh
