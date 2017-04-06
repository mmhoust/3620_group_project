# CPSC 3620 - Group Project (Part 2)
#### Keven Corcoran, Nathanael Harrell, Matthew Houston, Nicholas Reed

For our project, we decided to emulate the [TACC Wrangler](https://www.tacc.utexas.edu/systems/wrangler) supercomputer from the University of Texas.  The general layout of the Wrangler system can be seen below, as described [here](https://portal.wrangler.tacc.utexas.edu/) on TACC's website:

![Wrangler Layout](https://regmedia.co.uk/2015/07/07/wrangler_hw_scheme.jpg)

_Figure 1: Wrangler Layout_

## Cloudlab Layout

_**{{Picture of final cloud lab layout goes here}}**_

_Figure 2: Wrangler emulated in CloudLab_

In order to emulate the TACC Wrangler supercomputer on Cloudlab, we created a Cloudlab cluster consisting of 10 nodes.

One node was used as the "user" node (not pictured in **Figure 1**) to serve as an entry point to the whole system.  This node is in charge of scheduling (using [SLURM](https://slurm.schedmd.com/)) and is the location of the /home directory for the system.

Three nodes serve as the computation nodes for the system, emulating the orange section in **Figure 1**.

Three nodes serve as the mass storage system for the system, emulating the blue section in **Figure 1**.  These nodes work by making use of [Lustre](http://lustre.org/), as per the Wrangler [documentation](https://portal.tacc.utexas.edu/user-guides/wrangler#wrangler-architecture).

Three nodes serve as the high speed storage system for the system, emulating the green section in **Figure 1**.  These nodes are accessed via /local_scratch on all computation nodes.  For simplicity, our version mounts high speed storage nodes 1-to-1 to computation nodes, unlike Wrangler which allows its computation nodes to view all high speed storage nodes as one large storage.

## Similarity of CloudLab System to Wrangler

## Necessary Scripts for Deployment
** Slurm **
slurm.conf - configuration file for slurm. Must be present on unode and cnodes.
unode.sh - User node installation script. Generates and sends a munge key to all compute nodes. Starts slurm ctld.
cnode.sh - Compute node installation script. Starts slurm daemon.
## Validation Results
