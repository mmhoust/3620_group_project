#!/bin/bash
#a bash script to install lustre on the server nodes

#get e2fsprogs
wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm


#get lustre server RPMS
wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libcom_err-1.42.12.wc1-7.el6.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libss-1.42.12.wc1-7.el6.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm


#disable kernel and lustre yum updates
echo 'disable=kern*,lustre*'>>/etc/yum.conf

#use RPM to ensure the _lustre version is installed
rpm -Uvh kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm

#use yum to do the rest of the installs
yum install kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm
yum install lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-osd-ldiskfsmount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm
yum install e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm
yum install libcom_err-1.42.12.wc1-7.el6.x86_64.rpm
yum install libss-1.42.12.wc1-7.el6.x86_64.rpm


#configure LNET
echo “options lnet networks=tcp”>/etc/modprobe.d/lnet.conf

#configure services to automatically start
chkconfig lnet --add
chkconfig lnet on
chkconfig lustre --add
chkconfig lustre on

#restart to add the new kernel
/sbin/shutdown -r now