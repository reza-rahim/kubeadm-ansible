https://blog.container-solutions.com/how-to-monitor-your-kubernetes-cluster-with-prometheus-and-grafana


helm  pull  stable/grafana
tar xvf grafana-5.0.12.tgz


```bash 
###In your values.yml file for grafana add the dashboard data to the sidecar:

sidecar:
datasources:
enabled: true
label: grafana_datasource
enabled: true
label: grafana_dashboard

helm  template -name monitoring --namespace=monitoring grafana > grafana.yaml 

```


ssh kube-master-0 "mkdir -p ~/grafana"
scp  *.yaml kube-master-0:~/grafana 
ssh kube-master-0 "kubectl apply -f ~/grafana/ "

