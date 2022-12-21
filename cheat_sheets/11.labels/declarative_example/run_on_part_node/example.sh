kubectl edit nodes s1-kub-wn02

kubectl get nodes -L storage,gpus
NAME          STATUS   ROLES                  AGE   VERSION   STORAGE   GPUS
s1-kub-cn01   Ready    control-plane,master   11d   v1.21.0
s1-kub-wn01   Ready    <none>                 11d   v1.21.0   SSD       noGPU
s1-kub-wn02   Ready    <none>                 11d   v1.21.0   SSD       NVIDIA
s1-kub-wn03   Ready    <none>                 11d   v1.21.0   NonSSD    noGPU




