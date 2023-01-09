#first of all let's create the deployment with its service:
kubectl apply -f update-test.yml
#then check that pods, endpoints and service are created:
kubectl get po -l app=update-test
NAME                           READY   STATUS    RESTARTS   AGE
update-test-666c6ff56d-hvqk6   1/1     Running   0          21s
update-test-666c6ff56d-kbbvh   1/1     Running   0          21s
update-test-666c6ff56d-q959g   1/1     Running   0          21s

kubectl get svc -l app=update-test
NAME          TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
update-test   NodePort   10.102.16.19   <none>        8080:30036/TCP   27s

kubectl get endpoints -l app=update-test
NAME          ENDPOINTS                                            AGE
update-test   10.116.114.80:80,10.116.114.81:80,10.116.201.16:80   33s


#first option to update to change the image:
kubectl set image deployment/update-test nginx=nginx:1.23 --record
#"nginx" is the name of the container, --record will write the info into the annotation.
#here is the significant lines of the deployment "describe":
...
Annotations:            deployment.kubernetes.io/revision: 2
                        kubernetes.io/change-cause: kubectl set image deployment/update-test nginx=nginx:1.23 --record=true
...
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  39s   deployment-controller  Scaled up replica set update-test-666c6ff56d to 3
  Normal  ScalingReplicaSet  16s   deployment-controller  Scaled up replica set update-test-c6674d7cf to 1
  Normal  ScalingReplicaSet  15s   deployment-controller  Scaled down replica set update-test-666c6ff56d to 2
  Normal  ScalingReplicaSet  15s   deployment-controller  Scaled up replica set update-test-c6674d7cf to 2
  Normal  ScalingReplicaSet  14s   deployment-controller  Scaled down replica set update-test-666c6ff56d to 1
  Normal  ScalingReplicaSet  14s   deployment-controller  Scaled up replica set update-test-c6674d7cf to 3
  Normal  ScalingReplicaSet  12s   deployment-controller  Scaled down replica set update-test-666c6ff56d to 0

#revision is 2, so the deployment was updated once since is was created.
#change reason is written in the annotation
#in the events we can see how the old replica set (666c6ff56d) was scaling down while the new replica set (c6674d7cf) was scaling up piece by piece

#there is no old replica set in the description of the deployment, cause it is present there only during a rollout process:
OldReplicaSets:  <none>
NewReplicaSet:   update-test-c6674d7cf (3/3 replicas created)

#however, the old replica set is still present in a k8s database:
kubectl get replicasets.apps -l app=update-test -o wide
NAME                     DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES       SELECTOR
update-test-666c6ff56d   0         0         0       5m36s   nginx        nginx:1.22   app=update-test,pod-template-hash=666c6ff56d
update-test-c6674d7cf    3         3         3       5m13s   nginx        nginx:1.23   app=update-test,pod-template-hash=c6674d7cf


#check the rollout status:
kubectl rollout status deployment update-test 
deployment "update-test" successfully rolled out



#the second method to update deployment:
kubectl edit deployments.apps update-test


#the third and the most preferred one:
kubectl apply -f update-test-v2.yml --record

