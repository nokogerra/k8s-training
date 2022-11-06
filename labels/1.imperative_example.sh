#run pod with labels
kubectl run nginx01 --image=nginx --labels="dick1=butt,dick2=pic"
kubectl describe po nginx01 | grep -A 1 -i labels
Labels:       dick1=butt
              dick2=pic

#add label to pod
kubectl label po nginx01 labx=new
kubectl describe po nginx01 | grep -A 2 -i labels
Labels:       dick1=butt
              dick2=pic
              labx=new

#overwrite label
kubectl label po nginx01 labx=new2 --overwrite
kubectl describe po nginx01 | grep -A 2 -i labels
Labels:       dick1=butt
              dick2=pic
              labx=new2

#delete label
kubectl label po nginx01 labx-


