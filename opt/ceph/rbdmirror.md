```bash
ceph osd pool create data 32 
ceph osd pool application enable  data rbd

rbd mirror pool enable data pool

#rbd mirror pool enable data image


ceph auth get-or-create client.rbd-mirror-peer mon 'profile rbd' osd 'profile rbd'
[client.rbd-mirror-peer]
	key = AQCk20tfGbr2NhAAsClE7+1K/fZm4ul7u/s68w==

## From cluster 1 create the remote key file based on the remote key from above (i.e. on cluster1 use the key from cluster2, etc…)

cat <<EOF > remote-key-file
AQBm74xdZLi9MBAA9CYTtOgF5Roz+4p5jlJ7dQ==
EOF


## On north cluster
rbd --cluster ceph mirror pool peer add data client.rbd-mirror-peer@remote --remote-mon-host 10.4.0.2,10.4.0.3,10.4.0.4 --remote-key-file remote-key-file
rbd --cluster ceph mirror pool info data --all
rbd --cluster ceph mirror pool peer remove data 04685657-7aea-4118-8f8c-3aac4c19c33d


## On South cluster
rbd --cluster ceph mirror pool peer add data client.rbd-mirror-peer@remote --remote-mon-host 10.2.0.2,10.2.0.3,10.2.0.4 --remote-key-file remote-key-file
rbd --cluster ceph mirror pool info data --all

# create a image with journaling
rbd create bar --size 1024 --pool data --image-feature exclusive-lock,journaling

## the other cluster
rbd ls data

## demote the backup pool
rbd --cluster ceph mirror pool demote data  

##
rbd map data/bar 

mkfs.ext4 -m0 /dev/rbd0
mkdir /var/tmp/mysql
mount /dev/rbd0 /var/tmp/mysql

umount /var/tmp/mysql
rbd unmap /dev/rbd0


##
rbd-nbd map data/bar 
rbd-nbd list-mapped

 mkfs.xfs /dev/nbd0 
 mount /dev/nbd0  /var/tmp/mysql


```
