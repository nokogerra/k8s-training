#200 - OK
#201 - Created
#202 - Accepted (operation will be handled in an async mode)
#
#401 - Unauthrized (basically means that user is unauthanticated correctly against API server)
#403 - Access denied
#404 - Not found
#
#500 - Internal server error


#get verbose resoponse with API headers and body
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
