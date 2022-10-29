kubectl create deployment dec-app --image=gcr.io/google-samples/hello-app:1.0 --dry-run='client' -o yaml > dec-app.yml
kubectl apply -f dec-app.yml
kubectl expose deployment dec-app --port=80 --target-port=8080 --dry-run=client -o yaml > dec-app-service.yml
kubectl apply -f dec-app-service.yml
kubectl get all
kubectl get endpoints

sed -i 's/replicas: 1/replicas: 20/' dec-app.yml
kubectl apply -f dec-app.yml
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get endpoints

kubectl edit deployment dec-app
kubectl scale deployment dec-app --replicas=30

