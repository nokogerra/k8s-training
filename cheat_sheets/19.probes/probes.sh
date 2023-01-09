#All the checks are used in the strict order:

#1.Startup Probe
#A startup probe verifies whether the application within a container is started. Startup probes run before any other probe, and, 
#unless it finishes successfully, disables other probes. If a container fails its startup probe, then the container is killed and follows the pod’s restartPolicy.
#This type of probe is only executed at startup, unlike readiness probes, which are run periodically.
#The startup probe is configured in the spec.containers.startupprobe attribute of the pod configuration.

#Best practices: Specify a Startup Probe, if the pod takes a long time to start. 
#The Startup and Liveness Probe can use the same endpoint, but the Startup Probe can have a less strict failure threshhold which prevents a failure on startup


#2.Liveness Probe
#Liveness probes determine whether or not an application running in a container is in a healthy state.
#If the liveness probe detects an unhealthy state, then Kubernetes kills the container and tries to redeploy it.
#The liveness probe is configured in the spec.containers.livenessprobe attribute of the pod configuration.


#3.Readiness Probe
#Readiness probes determine whether or not a container is ready to serve requests. If the readiness probe returns a failed state, 
#then Kubernetes removes the IP address for the container from the endpoints of all Services.
#Developers use readiness probes to instruct Kubernetes that a running container should not receive any traffic. 
#This is useful when waiting for an application to perform time-consuming initial tasks, such as establishing network connections, loading files, and warming caches.

#Use case: Stop sending traffic to the pod, if the pod can not temporarily serve because a connection to another service (e.g. database) fails and the pod will recover later.

#Best practices: Include all necessary checks including connections to vital services. Nevertheless the check shouldn't take too long to complete.
#Always specify a Readiness Probe to make sure that the pod only gets traffic, if the pod can properly handle incoming requests.



#METHODS

#exec