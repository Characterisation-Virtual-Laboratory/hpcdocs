*********************
Scheduled Maintenance
*********************

We have scheduled quarterly outages for M3. The purpose of this is to ensure 
that we have communicated outages to our HPC users in advance, and at the same 
time, to ensure that the system is up-to-date as well as apply fixes to bugs 
and security vulnerabilities.

Dates are: 

	* 22/03/17 (COMPLETED) 
	* 05/07/17 (COMPLETED) 
	* 20/09/17 (COMPLETED) 
	* 06/12/17 (COMPLETED)
	* 09/01/18 (COMPLETED)
	* 07/03/18 (POSTPONED)
	* 14/03/18 (COMPLETED)
	* 06/06/18 (COMPLETED) 
	* 05/09/18 (COMPLETED)
	* 12/12/18 (COMPLETED)
	* 20/03/19 (COMPLETED)
	* 26/06/19 (COMPLETED)
	* 18/09/19
	* 11/12/19


===================================================================================

**26 JUN 2019 Maintenance - COMPLETED**

The M3 scheduled maintenance is now completed.

All the jobs have been resumed.

For your interest, the following works have been conducted:

 * Upgrading hypervisor compute components;

 * Patching and upgrading the login node and management node;

 * Upgrading BIOS and firmware for Lustre servers; and

 * Upgrading disk firmware for Lustre servers.

===================================================================================

**26 JUN 2019 Maintenance - COMPLETED**

Our regular system maintenance has been scheduled for Wednesday the 26th of June from 8:00 a.m. to 5:00 p.m.

A full system outage is required as this will impact the job scheduler. M3 will be offline during the outage window and users will not be able to access the login nodes via ssh or Strudel Web/Desktop (remote desktop).

A reservation has been created for this outage. Jobs that would run into this outage will not start so please take a look at your script if your job doesn’t start as expected in the queue. 

For your interest, the following works will be conducted:

 * Patching and upgrading the NFS server;

 * Upgrading hypervisor compute components;

 * Patching and upgrading the login nodes and data transfer node; and

 * Patching and upgrading the compute nodes;

If you have any queries or concerns regarding this outage, contact help@massive.org.au.

===================================================================================

**20 MAR 2019 Maintenance - COMPLETED**

Our regular maintenance has been scheduled for 20 Mar 2019, starting 8:00 a.m. - 5:00 p.m.

A full system outage is required as this will impact the job scheduler. M3 will be offline during the outage window and users will not be able to access the login nodes via ssh or Strudel Desktop (remote desktop).

A reservation has been created for this outage. Jobs that would run into this outage will not start so please take a look at your script if your job doesn’t start as expected in the queue. 

For your interest, the following works will be conducted:

 * Upgrading the job scheduler;

 * Patching and upgrading the NFS server;

 * Configuring the database server; and

 * Upgrading hypervisor compute components.

If you have any queries or concerns regarding this outage, contact help@massive.org.au.

===================================================================================

**12 DEC 2018 Maintenance - COMPLETED**

The M3 scheduled maintenance is now completed.

All the jobs have been resumed.

For your interest, the following works have been conducted:

 * NFS server uplift;

 * Upgrade operating system on the login and management nodes; and

 * Upgrade operating system on the hypervisors.

===================================================================================

**12 DEC 2018 Maintenance - COMPLETED**

Our regular maintenance has been re-scheduled for 12 Dec starting 8:00 a.m. - 5:00 p.m.

A full system outage is required as this will impact the job scheduler. M3 will be offline during the outage window and users will not be able to access the login nodes via ssh or Strudel Desktop (remote desktop).

A reservation has been created for this outage. Jobs that would run into this outage will not start so please take a look at your script if your job doesn’t start as expected in the queue. 

For your interest, the following works will be conducted:

 * Moving home dir to a filesystem with quota enforced;

 * Adding more vCPU on the NFS server;

 * Upgrade operating system on the login and management nodes; and

 * Upgrade operating system on the hypervisors.

If you have any queries or concerns regarding this outage, contact help@massive.org.au.

=======================================================================================================

**Research network maintenance 28 Nov Wed 9:00 a.m. - 5:00 p.m. - COMPLETED**


Monash network team is going to carry out a network change to enable new routing method and automation at the switches in Monash research network. Network switches often require updating to take advantage of improved functionality and stability. During the update, each network fabric will be interrupted for around 30 seconds.

As M3 is sitting on a number of network fabrics, jobs will be paused at 9 a.m. and we are anticipating a disruption to the user home directories, Strudel desktop jobs and login access at different point throughout the day.

If you have any queries or concerns regarding this outage, contact help@massive.org.au.

========================================================================================================================================================

**5 SEP 2018 Maintenance - COMPLETED**

For this outage, we have completed the following works:


	* Upgraded storage firmware;

	* Upgraded hardware firmware on the Lustre server; and

	* Fixed MTU issue on the host networking;


We are running behind with our schedules due to some unforeseen issues and over the next few days, we are going to complete the following task:


	* Upgrade operating system on the login and management nodes


===================================================================================

**5 SEP 2018 Maintenance - COMPLETED**

Our regular maintenance has been scheduled for 5 Sep starting 8:30 a.m. - 5:30 p.m.


A full system outage is required as this will impact the job scheduler. M3 will be offline during the outage window and users will not be able to access the login nodes via ssh or Strudel Desktop (remote desktop).


A reservation has been created for this outage. Jobs that would run into this outage will not start so please take a look at your script if your job doesn’t start as expected in the queue. 


For your interest, the following works will be conducted:


	* Upgrade storage firmware;

	* Upgrade hardware firmware on the Lustre server; 

	* Fix MTU issue on the host networking;

	* Upgrade operating system on the login and management nodes; and

	* Apply bug fixes on the job scheduler.


===================================================================================================================

**6 JUN 2018 Maintenance - COMPLETED**

The M3 scheduled maintenance is now completed.


For this outage, we have completed the following works:



	* Upgrade operating system on the switches;

	* Upgrade hardware firmware on the GPU nodes; and

	* Maintenance on the job scheduler (SLURM).


As part of this maintenance, we have also introduced Quality of Service (QoS) to M3 queue. All existing job submission scripts should still be working. But you should start considering using QoS in the future.


Quality of Service (QoS) provides a mechanism to allow a fair model to users who ask for the right resources in the job submission script. The quality of service associated with a job will affect the job in three ways:


	* Job Scheduling Priority
	* Job Preemption
	* Job Limits


A summary of the available QoS:

=========       ================================        =============   ================        ================        ========        ===========
Queue           Description                             Max Walltime    Max GPU per user        Max CPU per user        Priority        Preemption
=========       ================================        =============   ================        ================        ========        ===========
normal          Default QoS for every job               7 days          10                      280                     50              No
rtq             QoS for interactive job                 48 hours        4                       36                      200             No
irq             QoS for interruptable job               7 days          No limit                No limit                100             Yes
shortq          QoS for job with short walltime         30 mins         10                      280                     100             No
=========       ================================        =============   ================        ================        ========        ===========

.. note:: Priority: The higher the number the higher the priority is

For more information about how to use QoS, you can follow the link to our documentation page: http://docs.massive.org.au/M3/slurm/using-qos.html

We have also changed an algorithm in calculating fairshare in the queue by enabling priority flag in SLURM.

Lastly, we have now opened up the access to the new Skylake nodes. In order to introduce the new nodes, we have also created a new partition that consists of all the nodes, for more information about the new partition, follow the link to our user documentation page: http://docs.massive.org.au/M3/slurm/check-cluster-status.html




===================================================================================

**6 JUN 2018 Maintenance**

Our regular maintenance has been scheduled for 6 June starting 8:30 a.m. - 5:30 p.m.


A full system outage is required as this will impact the job scheduler. M3 will be offline during the outage window and users will not be able to access the login nodes via ssh or Strudel Desktop (remote desktop).


A reservation has been created for this outage. Jobs that would run into this outage will not start so please take a look at your script if your job doesn’t start as expected in the queue. 


For your interest, the following works will be conducted:


1. Upgrade operating system on the switches; 

2. Upgrade hardware firmware on the compute nodes; and

3. Maintenance on the job scheduler.

====================================================================================

**14 MAR 2018 maintenance - COMPLETED**

The M3 scheduled maintenance is now completed.

As a result of running the new job scheduler, the software that was previously compiled with old libraries might not work. We have made a new openmpi module available as well, which has been compiled with the new job scheduler libraries:

 `openmpi/1.10.7-mlx(default)`

Here is a list of software that might be affected by the change:

- abyss
- chimera
- dynamo
- emspring
- fasttree
- fsl
- gdcm
- geant4
- gromacs
- lammps
- mpifileutils
- netcdf
- openfoam
- python
- R
- relion
- scipion
- vtk

===================================================================================

**09 JAN 2018 Maintenance - COMPLETED**

As part of the filesystem expansion, we need to completely shut down the 
storage; an outage is scheduled for 9 Jan. 2018 from 8:00 a.m. - 9:00 p.m.

A full system outage is required and this will impact the access to the project
directories and running jobs. M3 will be offline during the maintenance window
so users will not be able to access the login nodes via SSH or Strudel
Desktop (remote desktop).

===================================================================================

**06 DEC 2017 Maintenance - COMPLETED**

We are still working on m3-dtn1.massive.org.au server but job scheduler is back online. All the remaining nodes are back online.

The following works were completed during the scheduled outage:

- Physical move of two Lustre servers to make space for the filesystem expansion;
- ZFS updates on NFS services; and
- A set of scripts has been pushed out to lower the resources for Strudel Large Desktop

The reason for this change is to make desktop utilization more efficient and to provide more large-scale desktops available to our user community.

From today, M3 Large desktops will be halved as follows:

.. code-block:: bash

        Configuration	Old Large Desktop	New Large Desktop
        -------------	-----------------	-----------------
	Memory		240GB			120GB
	GPU		4 x K80			2 x K80
	CPU		2 x 12 Cores		1 x 12 Cores

Based on our analysis we do not expect the majority of users to notice this change or be negatively impacted.

We understand that some users genuinely require a large GPU desktop configuration change might impact you, and if you ever need to run a desktop job that would require more than two GPUs, send us a request and we are more than happy to assist and attend to the request.

===================================================================================

**06 DEC 2017 Maintenance - COMPLETED**

The final quarterly maintenance for this year is scheduled for 6 Dec. from 8:30 a.m. - 4:30 p.m.

A full system outage is required and this will impact access to the project 
directories and running jobs. M3 will be offline during the maintenance window 
so users will not be able to access the login nodes via SSH or Strudel 
Desktop (remote desktop).

For your interest, the following works will be conducted:

    - Physical move of two Lustre servers to make space for the filesystem expansion
    - System updates for NFS services
    - A set of scripts will be pushed out to lower the resources for Strudel Large Desktop

A reservation has been created for this outage. Jobs that would run into this 
outage will not start so please take a look at your script if your job doesn't 
start as expected in the queue.

Based on usage data and user demand, we are making changes to the Desktop 
offerings on M3. The main change is the introduction of more Large Desktop 
resources to users. This involves decreasing the number of the GPUs allocated to 
each of these jobs. This will allow more users to utilise the GPU nodes in a 
more efficient way. If you ever need to run a desktop job that would require 
more than two GPUs, send us a request and we will be more than happy to assist you. 

===================================================================================

**20 SEP 2017 Maintenance - COMPLETED**

The following works were completed during the scheduled outage:

* NIC firmware upgraded on the management servers;
* Kernel update on the m3-login1;
* Kernel update on management servers' hypervisor;
* ZFS on the NFS services were updated.

Over the next few days, we are going to continue upgrading the cluster nodes. 
Nodes will be offline as required but there won’t be any interruption to the 
job scheduler.

Jobs should be running now and please report any issues you encounter with M3 to
help@massive.org.au. 
