kubectl apply -f web-app01.yml
kubectl get po -n web-app01 --show-labels
kubectl get po -n web-app01 -l tier=dev
kubectl get po -n web-app01 -l appversion=v1
kubectl get po -n web-app01 -l appversion!=v1 --show-labels
kubectl get po -n web-app01 -l 'apppurpose=web-app,appversion=v1'
kubectl get po -n web-app01 -l 'appversion in (v1,v2)'
kubectl get po -n web-app01 -l 'appversion notin (v1,v2)'

#show value of particular label for all pods in namespace
kubectl get po -n web-app01 -L appversion
NAME       READY   STATUS    RESTARTS   AGE    APPVERSION
websrv01   1/1     Running   0          7m8s   v1
websrv02   1/1     Running   0          7m8s   v2
websrv03   1/1     Running   0          7m8s   v1

kubectl get po -n web-app01 -L appversion,apppurpose

#change label value
kubectl label po websrv02 -n web-app01 tier=trash --overwrite
#add label to running pod
kubectl label po nginx01 labx=new
#delete label
kubectl label po nginx01 labx-
#add label to all pods
kubectl label po --all -n web-app01 newlabel=xyz

#delete pod on selector basis
kubectl get po -n web-app01 -l appversion=v2
kubectl delete po -n web-app01 -l appversion=v2

