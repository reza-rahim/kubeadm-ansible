
### how to set a failure domain
#### [STORAGE STRATEGIES GUIDE](https://access.redhat.com/documentation/en-us/red_hat_ceph_storage/4/html/storage_strategies_guide/index)

#### A failure domain dictates the block placement. For example,if the failure domain is set rack level, ceph would make sure that the replicated blocks are placed in a different racks.<br>

 
S https://access.redhat.com/webassets/avalon/d/Red_Hat_Ceph_Storage-4-Storage_Strategies_Guide-en-US/images/61f559b0c4ab3da4e48ce8a70dfeb4cf/Ceph_Strategies-Guide_459708_1017_01.png
 
```bash
## list the class crush, 
ceph osd crush tree


1       0.58398 root default  ## there is default root
-4       0.58398     host k8-2  ## the 
 0 hdd 0.48729         osd.0   
 1 ssd 0.09669         osd.1 



```
