#!/bin/bash

sudo apt-get update
sudo apt-get install munge
sudo apt-get install slurm-llnl

sudo wget -P /etc/slurm-llnl/ https://github.com/mmhoust/3620_group_project/blob/master/slurm.conf

sleep 10s

sudo service munge start
slurmd
