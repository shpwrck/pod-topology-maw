# pod-topology-maw
Automatically Apply Pod Topology Values

```Install Mutating Admission Webhook
scripts/test.sh
```

# Setup Test Cluster

- Example assumes k3d
- Example runs with 5 nodes

# Installs Kyverno

- Kyverno uses nested CRDs which doesn't work with Helm
- Hopefully Kyverno updates their CRDs prior to k8s 1.22 because of deprecation.

# Create Pod Topology Spread Constraints Generator

- Uses generated labels based on deployment name

