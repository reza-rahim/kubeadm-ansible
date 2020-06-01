
https://medium.com/@bipul.k.kuri/install-wrk-on-centos-redhat-7d9291de15d7

```bash

sudo yum -y groupinstall 'Development Tools'
sudo yum -y install openssl-devel git

git clone https://github.com/wg/wrk.git
cd wrk


./wrk -t32 -c200 -d120s  --latency  -H 'Connection: Close'   https://www.klovercloud.com/

```
