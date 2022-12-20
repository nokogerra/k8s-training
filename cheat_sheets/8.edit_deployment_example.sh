kubectl get deployments deployment-example -o yaml > file.yml
edit file.yml and kubectl apply -f file.yml

OR

kubectl edit deployments deployment-example

kubectl scale deployment deployment-example --replicas=1

!!!!!!
kubectl diff -f file.yml