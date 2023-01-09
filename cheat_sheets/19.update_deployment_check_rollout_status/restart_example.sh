#rollout restar will actually create a new replicaset based on the current image spec,
#so the new replicaset will be scaled up and the old one will be scaled down according to your update strategy:
kubectl rollout restart deployment update-test