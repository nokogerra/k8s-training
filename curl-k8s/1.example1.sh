kubectl apply -f nginx01.yml
kubectl get pods nginx01 -v 6
kubectl get pods nginx01 -v 7
kubectl get pods nginx01 -v 8
kubectl get pods nginx01 -v 9

kubectl proxy &
curl http://localhost:8001/api/v1/namespaces/default/pods/nginx01

kubectl get pods --watch -v6 &
ss -plant | grep kubectl
kubectl delete pod nginx01
kubectl apply -f nginx01.yml

kubectl logs nginx01 -v 6
kubectl proxy &
curl http://localhost:8001/api/v1/namespaces/default/pods/nginx01/log
