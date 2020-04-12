https://rook.io/docs/rook/v0.9/ceph-teardown.html

ssh kube-master-0 "kubectl delete -f /etc/kubernetes/kubeadm/storage/step.8.StorageClassEC.yaml"
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.7.StorageClass.yaml;
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.6.toolbox.yaml; 
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.5.object-user.yaml 
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.4.object.yaml; 
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.3.cluster.yaml; 
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.2.operator.yaml; 
ssh kube-master-0 kubectl delete -f /etc/kubernetes/kubeadm/storage/step.1.common.yaml; 
ssh kube-master-0 kubectl delete namespace rook-ceph

ssh skube-storage-0 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*";  rm -rf /var/lib/rook;'
ssh skube-storage-1 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*"; rm -rf /var/lib/rook;'
ssh skube-storage-2 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %; rm -rf /dev/ceph-*"; rm -rf /var/lib/rook;'


##  yum install jq
##  kubectl get ns rook-ceph -o json | jq '.spec.finalizers=[]' > ns-without-finalizers.json
##  kubectl proxy &
##  curl -X PUT http://localhost:8001/api/v1/namespaces/rook-ceph/finalize -H "Content-Type: application/json" --data-binary @ns-without-finalizers.json

