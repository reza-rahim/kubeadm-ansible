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
#### lookback device 
```bash

dd if=/dev/zero of=/root/virtual_hard_drive.bin bs=5GB count=1
mknod /dev/sdb b 7 500
losetup /dev/sdb /root/virtual_hard_drive.bin 

```
#### Delete storage node ###

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

