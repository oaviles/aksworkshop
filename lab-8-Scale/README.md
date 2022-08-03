Reference: https://docs.microsoft.com/en-us/learn/paths/aks-cluster-scalability/

Tweak the cluster autoscaler profiles

```shell
    az aks update -g << Azure Resource Group >> -n << AKS Cluster Name >> \
    --cluster-autoscaler-profile scan-interval=5s scale-down-unready-time=5m scale-down-delay-after-add=5m
```

Get AKS Cluster Status

```shell
    kubectl describe cm cluster-autoscaler-status -n kube-system
```
