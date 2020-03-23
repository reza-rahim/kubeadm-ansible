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



Change the following default to correct namespace


- --default-backend-service=default/release-nginx-ingress-default-backe
