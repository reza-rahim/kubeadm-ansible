## kubeadm-ansible

####
```bash
#install ansible

yum remove   ansible-2.9.6-1.el7  

```

#### SSH passwordless 
```bash
ssh-keygen -t rsa -N ''

# copy id_rsa.pub to authorized_keys 

cat <<EOF >/root/.ssh/config
Host *
  StrictHostKeyChecking no
  ForwardAgent yes
EOF
```

```bash
#list kubeadm version
yum --showduplicates list kubeadm 
```

```bash
###dashboard
ssh -L
-L 9090:localhost:9090  -L 3000:localhost:3000  -L 8080:localhost:8080 -L 8001:localhost:8001

## get the toket
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
##
kubectl proxy
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```

```bash
## ceph
https://github.com/rook/rook.github.io/blob/master/docs/rook/master/ceph-quickstart.md#deploy-the-rook-operator
```
### helm

```bash

https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

cd opt

helm pull  stable/nginx-ingress

tar xvf 

# change 

helm  template -name my-release nginx-ingress

change the RELEASE to lower case

```

