#Deployment with a service
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: default
  creationTimestamp: null
  labels:
    app: my-web-app
    version: "1.1"
  name: my-web-app
  annotations:
    owner: "Anatoliy Kopylov"
    owner_email: "mrgmegmgg@gmail.com"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-web-app
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: my-web-app
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
---
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: my-web-app
  name: my-web-app
  namespace: default
spec:
  type: NodePort
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 80
    nodePort: 30180
  selector:
    app: my-web-app
status:
  loadBalancer: {}


#apply
kubectl apply -f annotations-example.yml

kubectl annotate ... (label analogue)
