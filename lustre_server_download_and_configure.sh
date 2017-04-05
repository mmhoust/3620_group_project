#!/bin/bash
#a bash script to install lustre on the server nodes

#update everything to get alien
apt-get update

#converting .rpm to .deb
apt-get install alien dpkg-dev debhelper build-essential

#get e2fsprogs
wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm


#get lustre server RPMS
wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libcom_err-1.42.12.wc1-7.el6.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libss-1.42.12.wc1-7.el6.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm


#disable kernel and lustre yum updates
echo 'disable=kern*,lustre*'>>/etc/yum.conf

#need to do an apt-get update, then get alien to deal with .rpm files

#convert to rpm and depackage
alien ./kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm
dpkg -i ./kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.deb

#use yum to do the rest of the installs
alien ./kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm
alien ./lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
alien ./lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
alien ./lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
alien ./lustre-osd-ldiskfsmount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
alien ./e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm
alien ./e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm
alien ./libcom_err-1.42.12.wc1-7.el6.x86_64.rpm
alien ./libss-1.42.12.wc1-7.el6.x86_64.rpm


#configure LNET
echo “options lnet networks=tcp”>/etc/modprobe.d/lnet.conf

#configure services to automatically start
chkconfig lnet --add
chkconfig lnet on
chkconfig lustre --add
chkconfig lustre on

#restart to add the new kernel
#/sbin/shutdown -r now
