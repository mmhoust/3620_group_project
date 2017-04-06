#!/bin/bash

sudo apt-get update
sudo apt-get install munge
sudo apt-get install slurm-llnl

sleep 10s

sudo service munge start
slurmd
