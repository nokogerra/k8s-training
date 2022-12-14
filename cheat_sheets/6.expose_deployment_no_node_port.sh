#--target-port - the port, which the application inside a container is listening on
#--port - the port, on which the application is going to be exposed to the cluster members (nodes and pods)
kubectl expose deployment deployment-example --target-port=80 --port=8080

kubectl get services deployment-example -o wide
NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE   SELECTOR
deployment-example   ClusterIP   10.110.21.30   <none>        8080/TCP   37m   app=deployment-example

kubectl get endpoints deployment-example -o wide
NAME                 ENDPOINTS          AGE
deployment-example   10.116.153.65:80   38m

#so, from any pod or node of the same cluster you will be able to reach the http server via the ClusterIP and --port:

root@nignx02:/\# curl http://10.110.21.30:8080

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
