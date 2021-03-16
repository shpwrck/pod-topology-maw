# pod-topology-maw
Automatically Apply Pod Topology Values

```Install Mutating Admission Webhook
scripts/test.sh
```

### Setup Test Cluster

- Example assumes k3d
- Example runs with 5 nodes

### Installs Kyverno

- Kyverno uses nested CRDs which doesn't work with Helm
- Hopefully Kyverno updates their CRDs prior to k8s 1.22 because of deprecation.

### Create Pod Topology Spread Constraints Generator

- Uses generated labels based on deployment name

## KUBE-SCHEDULER DEFAULTS

- k8s 1.20 has switched to pod topology as a default plugin. You can see it in the k3s default config.
- Use the cluster-pod-topology-example.yaml and k3s-default.yaml to generate your own scheduler config.
- Pass the generated config into kube-scheduler with the '--kube-scheduler-arg=config=<<path_to_file>>'
