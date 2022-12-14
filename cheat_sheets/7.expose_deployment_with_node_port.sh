service.yml:

apiVersion: v1
kind: Service
metadata:
  name: deployment-example
spec:
  type: NodePort
  selector:
    app: deployment-example
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 80
    nodePort: 30036

kubectl apply -f deployment-example-service.yml

ansible@s1-kub02-wn03:~$ curl 10.99.175.248:8080
kagerro@kagerro-pc:~$ curl s1-kub02-wn03.nokogerra.lab:30036