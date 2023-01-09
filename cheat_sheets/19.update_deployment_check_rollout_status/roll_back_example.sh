#do not forget to add --record during update of a deployment

kubectl rollout history deployment update-test 
deployment.apps/update-test 
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl set image deployment/update-test nginx=nginx:1.23 --record=true

#to roll back to a specific version:
kubectl rollout undo deployment update-test --to-revision=1

#to roll back to a previous version:
kubectl rollout undo deployment update-test