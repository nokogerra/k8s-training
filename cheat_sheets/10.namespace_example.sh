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