#!!!K8s namespace has nothing to do with the linux namespace!
#
#Namespace provides:
#1.Resource allocation/quota (via resourcequotas kind);
#2.Naming boundary. There can be deployments, pods, etc with the same names if they are located in different namespaces;
#3.RBAC object.

#all resources, which belong to some namespace
kubectl api-resources --namespaced=true

#rosources, which can't be a part of a namespace
kubectl api-resources --namespaced=false


cat test-space.yml
---
apiVersion: v1
kind: Namespace
metadata:
  name: test-space
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: space-example
  name: space-example
  namespace: test-space
spec:
  replicas: 1
  selector:
    matchLabels:
      app: space-example
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: space-example
    spec:
      containers:
      - image: nginx
        name: nginx

kubectl apply -f test-space.yml --dry-run=server
namespace/test-space created (server dry run)
Error from server (NotFound): error when creating "test-space.yml": namespaces "test-space" not found

kubectl apply -f test-space.yml
namespace/test-space created
deployment.apps/space-example created

kubectl get deployments.apps --namespace test-space 
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
space-example   1/1     1            1           14s


#It will delete all the resources inside the namespace!!!
kubectl delete namespaces test-space
