https://rook.io/docs/rook/v0.9/ceph-teardown.html

kubectl apply -f /etc/kubernetes/kubeadm/storage/step.8.StorageClassEC.yaml
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.7.StorageClass.yaml;
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.6.toolbox.yaml; 
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.5.object-user.yaml 
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.4.object.yaml; 
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.3.cluster.yaml; 
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.2.operator.yaml; 
kubectl apply -f /etc/kubernetes/kubeadm/storage/step.1.common.yaml; 
kubectl delete namespace rook-ceph

ssh skube-storage-0 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*";'
ssh skube-storage-1 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*";'
ssh skube-storage-2 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*";'
