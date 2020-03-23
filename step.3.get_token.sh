#!/bin/bash
mkdir -p /var/klovercloud.com/cache  
mount -t tmpfs -o size=1M,mode=0755 tmpfs /var/klovercloud.com/cache

export JOIN=`ssh kube-master-0 kubeadm token create --ttl 30m --print-join-command` 

export OUTPUT=`ssh kube-master-0 kubeadm init phase upload-certs --upload-certs | tail -n 1`

echo $JOIN  " --certificate-key "  $OUTPUT  " --control-plane" > /var/klovercloud.com/cache/master_join.sh
echo "mkdir -p $HOME/.kube" >>  /var/klovercloud.com/cache/master_join.sh
echo "sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config" >>  /var/klovercloud.com/cache/master_join.sh
echo "sudo chown $(id -u):$(id -g) $HOME/.kube/config " >>  /var/klovercloud.com/cache/master_join.sh

echo $JOIN > /var/klovercloud.com/cache/worker_join.sh

chmod 755  /var/klovercloud.com/cache/*
