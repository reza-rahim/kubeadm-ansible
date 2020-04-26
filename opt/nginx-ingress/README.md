### helm

```bash


# change

helm  pull stable/nginx-ingress

tar xvf nginx-ingress-1.36.3.tgz

helm  template -name release --namespace nginx-ingress nginx-ingress > nginx-ingress.yaml

#set 
  hostNetwork: true
  add affinity and tolerance
  add resource

# clean up the helm file

```

