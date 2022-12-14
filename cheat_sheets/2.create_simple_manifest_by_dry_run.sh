kubectl create deployment nginx01 --replicas 2 --image nginx --dry-run=client -o yaml
kubectl run nginx01 --image nginx --dry-run=client -o yaml