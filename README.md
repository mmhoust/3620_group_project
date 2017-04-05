# CPSC 3620 - Group Project (Part 2)
#### Keven Corcoran, Nathanael Harrell, Matthew Houston, Nicholas Reed

For our project, we decided to emulate the [TACC Wrangler](https://www.tacc.utexas.edu/systems/wrangler) supercomputer from the University of Texas.  The general layout of the Wrangler system can be seen below, as described [here](https://portal.wrangler.tacc.utexas.edu/) on TACC's website:

![Wrangler Layout](https://regmedia.co.uk/2015/07/07/wrangler_hw_scheme.jpg)

_Figure 1: Wrangler Layout_

## Cloudlab Layout

_**{{Picture of final cloud lab layout goes here}}**_

_Figure 2: Wrangler emulated in CloudLab_

In order to emulate the TACC Wrangler supercomputer on Cloudlab, we created a Cloudlab cluster consisting of 10 nodes.

One node was used as the user node (u_node - not pictured in **Figure 1**) to serve as an entry point to the whole system.

Three nodes serve as the mass storage system for the system, emulating the blue section in **Figure 1**.  These nodes have to run on Utah CloudLab machines because Utah's machines most closely simulate the ARM node's Wrangler uses.

Three nodes serve as the computation nodes for the system, emulating the orange section in **Figure 1**.

Three nodes serve as the high speed storage system for the system, emulating the green section in **Figure 1**.  These nodes are accessed via /local_scratch on all computation nodes.  For simplicity, our version mounts high speed storage nodes 1-to-1 to computation nodes, unlike Wrangler which allows its computation nodes to view all high speed storage nodes as one large storage.

## Similarity of CloudLab System to Wrangler

The user node is the entry point to the system and therefore in charge of scheduling jobs on the systems 3 computation nodes.  In order to most closely simulate the Wrangler system, we implemented [SLURM](https://slurm.schedmd.com/) job scheduling system on the user node which is the same system Wrangler uses according to the Wrangler [documentation](https://portal.tacc.utexas.edu/user-guides/wrangler#reservations-normal).  Here is also where the /home directory for the system resides.

The mass storage system for our system uses [Lustre](http://lustre.org/), which is the mass storage system used by Wrangler according to the [documentation](https://portal.tacc.utexas.edu/user-guides/wrangler#architecture-filesystem).  Utah nodes in CloudLab provide the highest simiarity to the ARM nodes used in Wrangler, so they are required for our emulation.

The computation nodes require no special hardware or software as they are simply in place to run tasks assigned to them by SLURM on the user node.

The high speed storage nodes make use of the flash storage system [DSSD](https://www.emc.com/en-us/storage/discover-flash-storage/index.htm), according to the [documentation](https://portal.tacc.utexas.edu/user-guides/wrangler#wrangler-flash-storage), for fast access to large amounts of data.  Since we do not have access to a DSSD system we used ARM nodes because they most closely resemble the DSSD nodes Wrangler makes use of.

## Necessary Scripts for Deployment

## Validation Results
