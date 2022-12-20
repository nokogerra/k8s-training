#api versions of objects of your version of k8s
kubectl api-versions
#you'll see versions in api_group/version form. "v1" group is a "core" or "legacy" api group (nodes, pods, etc)
#v1aplha1 - early (alpha) release - testing only. There can be breaking changes in alpha release. Disabled by default;
#v1beta1 - more stable, though it is recommended to test it in a lab environment before prod implementation;
#v1 - production-ready stable release.


#all available resources (check SHORTNAMES for aliases, e.g. kubectl get no)
kubectl api-resources

#resources of a particular group:
kubectl api-resources --api-group=authentication.k8s.io

#all resources, which belong to some namespace
kubectl api-resources --namespaced=true

#rosources, which can't be a part of a namespace
kubectl api-resources --namespaced=false

#simple explain
kubectl explain deploy

#nested explain
kubectl explain deploy.apiVersion

#recursive explain
kubectl explain deploy --recursive
kubectl explain deploy.spec --recursive


