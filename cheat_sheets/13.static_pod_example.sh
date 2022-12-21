#bare pods - pods which are created via api-server, but doesn't belong to any deployment (replica set)
#static pods and bare pods are not recreated when node dies
#static pods manifests location is defined in staticPodPath param of kubelet config (/var/lib/kubelet/config.yaml)
#all pods described in staticPodPath will be restarted along with the node on which they are described (like k8s system pods, which are static and not inside a deployment)

#such pods are controlled by the kubelet on a particular node, and not by api-server, however for each static pod the "mirror"
#is created in api-server, so the pod can be seen during request to k8s api, but you won't be able to control it via api.
#if you stop a static pod, if will be restarted automatically by the kubelet, if you remove a manifest, the static pod will be stopped and deleted

#Look for controller "Node":
kubectl get pods --all-namespaces -o custom-columns=NAME:.metadata.name,CONTROLLER:.metadata.ownerReferences[].kind,NAMESPACE:.metadata.namespace

#show only static pods:
kubectl get pods --all-namespaces -o json | jq -r '.items | map(select(.metadata.ownerReferences[]?.kind == "Node" ) | .metadata.name) | .[]'