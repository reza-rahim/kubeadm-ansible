https://rook.io/docs/rook/v0.9/ceph-teardown.html


ssh 10.2.0.1 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  sgdisk --zap-all /dev/nvme0n1;  dmsetup  remove_all ; rm -rf /dev/ceph-*";  '
ssh 10.2.0.3 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  sgdisk --zap-all /dev/nvme0n1;  dmsetup  remove_all ; rm -rf /dev/ceph-*"; '
ssh 10.2.0.4 'bash -c "rm -rf /var/lib/rook; sgdisk --zap-all /dev/sdb;  sgdisk --zap-all /dev/sdc;  sgdisk --zap-all /dev/nvme0n1;  dmsetup  remove_all ; rm -rf /dev/ceph-*"; '


