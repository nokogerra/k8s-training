cat /etc/crictl.yaml
runtime-endpoint: unix:///var/run/containerd/containerd.sock
image-endpoint: unix:///var/run/containerd/containerd.sock
timeout: 10
#debug: true

sudo crictl ps -a | grep deplo
aa25371d37d71       ac8efec875ce3       3 hours ago         Running             nginx               0                   8f54ce573ee42       deployment-example-557967969b-s2nh4

sudo crictl exec -it aa25371d37d71 /bin/bash
sudo crictl inspect aa25371d37d71

sudo crictl images
