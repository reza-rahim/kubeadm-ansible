
#### [CEPH STORAGE STRATEGIES GUIDE](https://access.redhat.com/documentation/en-us/red_hat_ceph_storage/4/html/storage_strategies_guide/index)

#### A failure domain dictates the block placement. For example,if the failure domain is set rack level, ceph would make sure that the replicated blocks are placed in a different racks.<br>


![ceph bucket](Ceph_Bucket.png)
 

```bash
## list the class crush, 
ceph osd crush tree


1       0.58398 root default  ## there is default root
-4       0.58398     host k8-2  ## the 
 0 hdd 0.48729         osd.0   
 1 ssd 0.09669         osd.1 



```
