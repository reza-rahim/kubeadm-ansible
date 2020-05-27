### helm

```bash


# change

helm  pull stable/nginx-ingress

tar xvf nginx-ingress-1.36.3.tgz

https://kubernetes.github.io/ingress-nginx/user-guide/tls/

add the following to value.yaml under config:

  ssl-ciphers: "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA256:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA"
  ssl-protocols: "TLSv1 TLSv1.1 TLSv1.2 TLSv1.3"


helm  template -name release --namespace nginx-ingress nginx-ingress > nginx-ingress.yaml

#set 
  hostNetwork: true
  add affinity and tolerance
  add resource

# clean up the helm file


cipher test

nmap -script ssl-enum-ciphers www.klovercloud.com 

```


