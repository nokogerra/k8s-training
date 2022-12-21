kubectl get po --show-labels

kubectl get po --selector dick1=butt
kubectl get po -l dick1!=butt
kubectl get po -l 'dick1 in (butt,twat)'
kubectl get po -l 'dick1 notin (butt,twat)'