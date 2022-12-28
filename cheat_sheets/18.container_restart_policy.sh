#"Always" (default) - will always restart all the containers inside a pod;
#"OnFailure" - restart only in case of non-graceful termination;
#"Never"

#restart policy must be specified on the pod level:

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: my-app
  name: my-app
spec:
  containers:
  - image: nginx
    name: web-app
    resources: {}
    ports:
    - containerPort: 80
  restartPolicy: OnFailure

  #in this case if I will terminate nginx from the container's shell (/etc/init.d/nginx stop), the pod become "completed" and won't start automatically.

  