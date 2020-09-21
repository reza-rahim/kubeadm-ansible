https://github.com/grafana/tanka/releases

curl -fSL -o "/usr/local/bin/tk" "https://github.com/grafana/tanka/releases/download/v0.8.0/tk-linux-amd64"

chmod a+x "/usr/local/bin/tk"

### tonka
https://github.com/grafana/loki/blob/master/docs/installation/tanka.md

##install jb
yum -y install go
go get -u github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
mv /root/go/bin/jb /usr/local/bin

### Helm

```bash
helm repo add loki https://grafana.github.io/loki/charts
helm  pull loki/promtail 
helm  pull loki/loki
```

### Config
https://grafana.com/docs/loki/latest/configuration/examples/

https://grafana.com/blog/2020/07/21/loki-tutorial-how-to-send-logs-from-eks-with-promtail-to-get-full-visibility-in-grafana/

https://grafana.com/go/webinar/logging-with-loki-essential-configuration-settings/?pg=blog&plcmt=body-txt&cta=upcoming-webinars


