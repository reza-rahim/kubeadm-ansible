## kubeadm-ansible

```bash
cat <<EOF >/root/.ssh/config
Host *
  StrictHostKeyChecking no
  ForwardAgent yes
EOF
```

### Delete storage node ###

```bash
1 . comment out the storage creation part in terraform and terraform apply
2 . 


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

