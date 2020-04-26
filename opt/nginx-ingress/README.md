### helm

```bash


# change

helm  pull stable/nginx-ingress

tar xvf nginx-ingress-1.36.3.tgz

helm  template -name release --namespace monitoring nginx-ingress

change the RELEASE to lower case



Change the following default to correct namespace


- --default-backend-service=default/release-nginx-ingress-default-backe

```

