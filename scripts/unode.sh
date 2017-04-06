#!/bin/bash

sudo apt-get update
sudo apt-get install munge
sudo apt-get install slurm-llnl

sudo create-munge-key
sudo scp /etc/munge/munge.key /