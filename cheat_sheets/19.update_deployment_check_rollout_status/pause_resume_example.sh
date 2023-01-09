#in case you need to urgently stop the rollout, you can pause it:
kubectl rollout pause deployment update-test

#then you can make changes and they will be applied after you resume the rollout:
kubectl rollout resume deployment update-test
