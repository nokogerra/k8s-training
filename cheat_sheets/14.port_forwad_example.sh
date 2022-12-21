kubectl run forw-port --image=nginx

#9080 - local port on my machine, 80 - container app port
kube-tests$ kubectl port-forward forw-port 9080:80
Forwarding from 127.0.0.1:9080 -> 80
Forwarding from [::1]:9080 -> 80

kubectl port-forward forw-port 9080:80 &

ss -aln | grep 9080
tcp   LISTEN 0      4096                                                                                127.0.0.1:9080             0.0.0.0:*          
tcp   LISTEN 0      4096                                                                                    [::1]:9080                [::]:*          

curl http://localhost:9080
Handling connection for 9080
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
.............
</html>

fg
kubectl port-forward forw-port 9080:80
^C
