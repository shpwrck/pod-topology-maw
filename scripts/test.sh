#!/bin/bash
set -e

# Create Initial Cluster
k3d cluster create pod-topology-demo --agents 5 --k3s-server-arg '--kube-apiserver-arg=feature-gates=EvenPodsSpread=true' --k3s-server-arg '--kube-scheduler-arg=feature-gates=EvenPodsSpread=true'
for node in {0..4}; do kubectl label node k3d-pod-topology-demo-agent-$node topology.kubernetes.io/zone=zone-$node; done

# Create Kyverno Resources
kubectl apply -f ./kyverno/install.yaml
kubectl apply -f ./kyverno/mutate.yaml

# Create a deployment and validate
kubectl create deployment --image=rancher/hello-world test-this --replicas 5

# Validate that it's evenly spread
