#generate default kubeadm config
kubeadm config print init-defaults

#init cluster controller
sudo kubeadm init --config=ClusterConfiguration.yaml

#launch calico
kubectl apply -f calico.yaml

#check all pods
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces --watch

#get cluster nodes
kubectl get nodes

#install kubectl autocompleteion
#https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-linux/
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null