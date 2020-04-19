ssh vmi313422.contaboserver.net "kubeadm reset -f ;rm -rf $HOME/.kube/config ; rm -rf /etc/kubernetes; iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X"
ssh vmi313424.contaboserver.net "kubeadm reset -f ; rm -rf $HOME/.kube/config ; rm -rf /etc/kubernetes;iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X"
ssh vmi358327.contaboserver.net "kubeadm reset -f ; rm -rf $HOME/.kube/config ; rm -rf /etc/kubernetes;iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X"
