#RollingUpdate type force a new replicaset to scale up while the old replicaset is scaling down, so at some period of time there will be an old image containers and a new image containers
#in the strategy you can specify the maximum number (or percentage) of pods which will be unavailable during a rollout process and the maximum number of pods, which is going to exeed
#the desired number of pods in the replica set (SURGE):
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge

#RollingUpdate is the default strategy type, however if the software doesn't support that method (old and new images can't work together), there is another type: Recreate.
#Recreate will scale down the old replicaset first, and only after that the new replicaset is scaled up.


#progressDeadlineSeconds is the time kubelet waits for pods of deployment to become ready (actually it waits for 0 exit code from rollout process), otherwise
#kubelet declares deployment as dead. progressDeadlineSeconds default value is 600 seconds.
#0 exit code from rollout process is the same as:
kubectl rollout status deployment update-test 
deployment "update-test" successfully rolled out


