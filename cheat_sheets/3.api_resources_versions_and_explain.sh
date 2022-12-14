#api versions of objects of your version of k8s
kubectl api-versions

#all available resources (check SHORTNAMES for aliases, e.g. kubectl get no)
kubectl api-resources

#all resources, which belong to some namespace
kubectl api-resources --namespaced=true

#rosources, which can't be a part of a namespace
kubectl api-resources --namespaced=true

#simple explain
kubectl explain deploy

#nested explain
kubectl explain deploy.apiVersion

#recursive explain
kubectl explain deploy --recursive
kubectl explain deploy.spec --recursive


