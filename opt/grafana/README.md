https://blog.container-solutions.com/how-to-monitor-your-kubernetes-cluster-with-prometheus-and-grafana


helm  pull  stable/grafana
tar xvf grafana-5.0.12.tgz


```bash 
https://github.com/ceph/ceph/tree/master/monitoring
```


```bash 
###In your values.yml file for grafana add the dashboard data to the sidecar:

sidecar:
datasources:
enabled: true
label: grafana_datasource
enabled: true
label: grafana_dashboard

helm  template -name monitoring --namespace=monitoring grafana > grafana.yaml 



ssh kube-master-0 "mkdir -p ~/grafana"
scp  *.yaml kube-master-0:~/grafana 
ssh kube-master-0 "kubectl apply -f ~/grafana/ "

```


```bash

kubectl exec -it -n monitoring monitoring-grafana-58c6d6dfb8-55txr -c grafana sh 

grafana-cli plugins install btplc-status-dot-panel


mount "/var/lib/grafana/plugins/" with pv


```
