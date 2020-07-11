
### how to set a failure domain
#### A failure domain dictates the block placement. For example,if the failure domain is set rack level, ceph would make sure that the replicated blocks are placed in a different racks.


```bash
ceph osd crush tree
```
