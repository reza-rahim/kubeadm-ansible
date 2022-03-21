```bash
https://www.golinuxcloud.com/generate-self-signed-certificate-openssl/

openssl genrsa  -out ca.key 4096

openssl req -new -x509 -days 3650 -config openssl.cnf  -key ca.key  -out ca.crt  

openssl x509 -text -noout -in ca.crt 

kubectl create secret tls my-tls-secret --key ca.key --cert ca.crt

```
