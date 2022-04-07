# Local recovery feature validation with FLink 1.15 Snapshot
Flink 1.15 has support for [local recovery across process restarts](https://nightlies.apache.org/flink/flink-docs-master/docs/deployment/resource-providers/standalone/working_directory/#artifacts-stored-in-the-working-directory).

This repo contains everything needed to spin up a local test environment running on minikube: 
* A flink job manager
* A flink task manager statefulset with 3 replicas. Local recovery configs can be found in `flink-configuration-configmap.yaml`
* A minio cluster for S3 storage (chekpoints storage)

## Setup details
* The flink cluster uses `StateMachineExample` shipped with the flink distribution.
* A custom docker image is built locally based on a docker image generated from https://github.com/apache/flink/tree/release-1.15
* S3 checkpoint storage is configured
* Locally recovery is enabled

## Local recovery testing
1. To start everything, run the following from the project root directory:

`./scripts/create.sh`
2. To test local recovery, task manager statefulset is scaled down to 2:

`kubectl scale --replicas=2 sts/flink-taskmanager`
3. This will terminate `flink-taskmanager-2` which will stop the flink job since we only have 2 task slots now while parallelism is set to 3.

4. Scaling the statefulset back to 3 adds a 3rd pod. Total task slots is 3 so the job can start again:

`kubectl scale --replicas=3 sts/flink-taskmanager`
5. Assuming local recovery works as stated, something about `IncrementalLocalKeyedStateHandle` is printed in the logs:

`kubectl logs -f flink-taskmanager-2`
6. Run the following from the project root directory to stop everything:

`./scripts/terminate.sh`

## To access Flink UI:
`kubectl port-forward <flink-job-manager-pod-name.> 8081:8081`

UI can be accessed using `http://127.0.0.1:8081` now.
