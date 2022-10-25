#create deployment
kubectl create deployment test1 --image=gcr.io/google-samples/hello-app:1.0
#create and run standalone pod
kubectl run test1-pod --image=gcr.io/google-samples/hello-app:1.0

ansible@s1-kub-cn01:~$ kubectl get pods -o wide
#NAME                     READY   STATUS    RESTARTS   AGE     IP               NODE          NOMINATED NODE   READINESS GATES
#test1-57f5c5dc5c-9ws5r   1/1     Running   0          7m32s   10.115.166.193   s1-kub-wn02   <none>           <none>
#test1-pod                1/1     Running   0          3m9s    10.115.75.65     s1-kub-wn01   <none>           <none>
#
# 1-st - pod in the depolyment, 2-nd - standalone pod

#https://kubernetes.io/docs/tasks/debug/debug-cluster/crictl/
#from the worker node
sudo crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps

