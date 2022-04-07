#!/bin/bash

set -e

kubectl delete -f k8s/minio-cluster.yaml
