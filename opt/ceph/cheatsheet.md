
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
