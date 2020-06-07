
```bash

ceph quorum_status --format json-pretty
ceph mon dump

#Check the cluster usage status
ceph df

#Check the Ceph monitor, OSD, pool, and placement group stats:
ceph mon stat
ceph osd stat
ceph osd pool stat
ceph pg stat

#List the placement group:
ceph pg dump

#List the Ceph pools in detail:
ceph osd pool ls detail

#Check the CRUSH map view of OSDs:
ceph osd tree

#Check Ceph's OSD usage:
ceph osd df

#List the cluster authentication keys:
ceph auth list

```

```bash
## delete a pool create a pool 

ceph osd pool create k8 100 
ceph osd pool application enable  k8 rbd


##  create crush rule
osd crush rule create-replicated <name> <root> <type> {<device class>}
ceph osd crush rule create-replicated hdd default host hdd
ceph osd crush rule create-replicated ssd ssd host ssd

##set the crush rule to pool
ceph osd pool set <pool>  crush_rule <crush rule>
ceph osd pool set k8  crush_rule ssd 

##create 50 GB image named bar

rbd create --size 50200 k8/bar

rbd create --size 1024 k8/foo --object-size 8M

## insert data int did image

rbd -p k8 bench bar --io-type write --io-size 8192 --io-threads 256 --io-total 50G --io-pattern seq

rbd -p k8 bench bar --io-type read --io-size 8192 --io-threads 256 --io-total 50G --io-pattern seq

##snapshot
rbd snap create k8/foo@snapname

rbd snap ls k8/foo

rbd snap rm k8/foo@snapname


## performance	

rbd bench-write bar --pool=k8

## copy a bock 
### Create one 2 meg  file
dd if=/dev/zero of=file.txt count=1024 bs=1048

rados -p pl put file.txt /tmp/file.txt
rados -p pl get file.txt /tmp/file.txt 


## mirror 

##

rbd rm k8/foo  

##
ceph osd pool rm --yes-i-really-really-mean-it k8 k8 
```
