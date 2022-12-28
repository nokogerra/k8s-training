#After the pod is marked as terminated (by a user or a controller), kubelet sends SIGTERM to pod's processes.
#If processes in container(s) haven't termintated gracefully during the gracetime period (30 seconds by default),
#then kubelet sends SIGKILL.
#in some cases, it is appropriate to forcefully delete pod if it's termination is stuck

kubectl delete pod <name> --grace-period=<seconds>
kubectl delete pod <name> --grace-period=<seconds> --force

#specify grace period in a spec:
kubectl explain pod.spec.terminationGracePeriodSeconds
KIND:     Pod
VERSION:  v1

FIELD:    terminationGracePeriodSeconds <integer>
