
#### [CEPH STORAGE STRATEGIES GUIDE](https://access.redhat.com/documentation/en-us/red_hat_ceph_storage/4/html/storage_strategies_guide/index)

##### The CRUSH map for your storage cluster describes your device locations within CRUSH hierarchies and a rule for each hierarchy that determines how Ceph stores data.

##### The CRUSH map contains at least one hierarchy of nodes and leaves. The nodes of a hierarchy, called "buckets" in Ceph, are any aggregation of storage locations as defined by their type. For example, rows, racks, chassis, hosts, and devices. 

##### OSD is considered as leaf where the objects live. 
##### A disk can be mapped to one or more OSD.


![ceph bucket](Ceph_Bucket.png)

<br>



##### A failure domain dictates the object placement. For example,if the failure domain is set rack level, ceph would make sure that the replicated blocks are placed in a different racks. This ensure data survival in the event of whole rach failure.<br>


```bash
## list the class crush, 
ceph osd crush tree


1       0.58398 root default  ## there is the default hierarchy. Each hierarchy starts with root bucket.  
-4       0.58398     host k8-2  ## host is always added as default bucket       
 0 hdd 0.48729         osd.0    ## osd are listed under the host and ceph gives a device-class based on the storage
 1 ssd 0.09669         osd.1    ## type, such as hdd, ssd or nvme

```


```bash
# Create a new crush hierarchy with root bucket

ceph osd crush add-bucket ssd-root root

```

```bash
# Create rack bucket
# ceph osd crush add-bucket < rack name > rack 
ceph osd crush add-bucket  rack1  rack

# move the rack1 under defautl root
ceph osd crush move rack1  root=default

# move the host (k8-2) under rack1
ceph osd crush move k8-2  rack=rack1 


# the new hierarchy

ID  CLASS WEIGHT  TYPE NAME         
    
 -1       0.58398 root default      
-10       0.58398     rack rack1    
 -4       0.58398         host k8-2 
  0 hdd   0.48729             osd.0 
  1 ssd   0.09669             osd.1 

``` 

##### Chaning the device class for the OSD

```bash
# we would create change the default device class for the OSD
# remove the existing class from osd 0 and 1
# ceph osd crush rm-device-class < osd id >
ceph osd crush rm-device-class 0
ceph osd crush rm-device-class 1

# assign some new device class to OSD
# set hdd devices as cold_cls and ssd devices as hot_cls
ceph osd crush set-device-class cold_cls osd.0
ceph osd crush set-device-class hot_cls osd.1

ID  CLASS    WEIGHT  TYPE NAME           
 -1          0.58398 root default      
-10          0.58398     rack rack1    
 -4          0.58398         host k8-2 
  0 cold_cls 0.48729             osd.0 
  1  hot_cls 0.09669             osd.1 

```

#### define crush rule to introduce the failure domain.
```bash 
#crush rule
# ceph osd crush rule create-replicated <rule-name> <root> <failure-domain-type> <device-class>:

ceph osd crush rule create-replicated cold_rule  default rack cold_cls
ceph osd crush rule create-replicated hot_rule  default rack  hot_cls

```

##### Ceph pool. [command reference](https://docs.ceph.com/docs/jewel/rados/operations/pools/)

```bash
#ceph osd pool create {pool-name} {pg-num} [{pgp-num}] [replicated] [crush-ruleset-name] 

# Create cole pool with cold_rule
ceph osd pool create cold_pool 10 10 replicated cold_rule

# Create cole pool with cold_rule
ceph osd pool create hot_pool 10 10 replicated hot_rule

# set the replica to 1 for both cold_pool and hot_pool pool
ceph osd pool set cold_pool  size 1
ceph osd pool set hot_pool   size 1

```
     
#####  Enable use of an application <app> [cephfs,rbd,rgw] on pool <poolname>

```bash
# ceph osd pool application  --help
# ceph osd pool application enable <pool> <app> 

ceph osd pool application enable cold_pool rbd
ceph osd pool application enable hot_pool rbd
```

##### BLOCK DEVICE [COMMANDS](https://docs.ceph.com/docs/jewel/rbd/rados-rbd-cmds/)

```bash
# rbd create --size {megabytes} {pool-name}/{image-name}

rbd create --size 5000 cold_pool/cold_rbd
rbd create --size 5000 hot_pool/hot_rbd

# perforamce
rbd bench-write cold_rbd --pool=cold_pool
rbd bench-write hot_rbd --pool=hot_pool

#write data
rbd -p cold_pool bench cold_rbd --io-type write --io-size 8192 --io-threads 256 --io-total 4G --io-pattern seq
rbd -p hot_pool bench hot_rbd --io-type write --io-size 8192 --io-threads 256 --io-total 4G --io-pattern seq


#cleanup

rbd rm cold_pool/cold_rbd 
rbd rm hot_pool/hot_rbd 

```


