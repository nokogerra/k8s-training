#generate containerd config
sudo containerd config default | sudo tee /etc/containerd/config.toml

#you need to make sure that SystemdCgroup = true in the config:
#      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]
        ...
#        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
#          base_runtime_spec = ""
#           ...
#          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
#          ...
#            SystemdCgroup = true


#generate kubeadm config
kubeadm config print init-defaults | tee ClusterConfiguration.yaml
#you must specify:
#localAPIEndpoint:
#  advertiseAddress: {{ adv_address }}
#...
#nodeRegistration:
#  criSocket: {{ cri_socket }}
#  name: {{ node_name }}
#...
#kubernetesVersion: {{ kub_version }}
#
#also you need to add these lines to the config:
#---
#apiVersion: kubelet.config.k8s.io/v1beta1
#kind: KubeletConfiguration
#cgroupDriver: systemd

#you can change the name of the cluster, for example:
#clusterName: kubernetes


#calico manifest:
wget https://docs.projectcalico.org/manifests/calico.yaml
#you'd better change the IP pool in the calico manifest, for example:
#- name: CALICO_IPV4POOL_CIDR
#              value: 10.116.0.0/16
