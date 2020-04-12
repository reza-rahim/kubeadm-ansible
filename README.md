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

