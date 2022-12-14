#generate simple manifest
kubectl create deployment deployment-example --image=nginx --dry-run=client -o yaml > deployment-example.yml

#fix the manifest if needed
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: deployment-example
  name: deployment-example
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deployment-example
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: deployment-example
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}

#create deployment
kubectl apply -f deployment-example.yml 

