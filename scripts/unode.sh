#!/bin/bash

sudo apt-get update
sudo apt-get install munge
sudo apt-get install slurm-llnl

sudo wget -P /etc/slurm-llnl/ https://github.com/mmhoust/3620_group_project/blob/master/slurm.conf

sudo create-munge-key

sudo scp /etc/munge/munge.key c_node_1:/etc/munge
sudo scp /etc/munge/munge.key c_node_2:/etc/munge
sudo scp /etc/munge/munge.key c_node_2:/etc/munge

sudo service munge start
slurmctld
