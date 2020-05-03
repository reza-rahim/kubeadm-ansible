
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

```
