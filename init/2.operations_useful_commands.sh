#cluster info
kubectl config get-contexts
kubectl cluster-info
kubectl cluster-info dump

#output formatting
kubectl get nodes -o wide
kubectl get nodes -o yaml
kubectl get nodes -o json

#namespaces
kubectl get namespaces -o wide
kubectl get pods --namespace kube-system
kubectl get all --all-namespaces

#API
kubectl api-resources -o wide
kubectl api-versions

#explain
kubectl explain pod
kubectl explain pod.spec
kubectl explain pod.spec.tolerations
kubectl explain pod --recursive

#describe
kubectl describe nodes s1-kub-cn01