.. _using-qos:


************************
QoS (Quality of Service)
************************

We have implemented Quality of Service (QoS) starting 6th of June 2018.

The QoS can be added to each job that is submitted to Slurm. The quality of service associated with a job will affect the job in three ways:

1. Job Scheduling Priority
2. Job Preemption
3. Job Limits

************************************
How to run jobs with QoS
************************************

A table to show the differences between QoS:

=========	================================	=============	================	================	========	===========
Queue		Description				Max Walltime	Max GPU per user	Max CPU per user	Priority	Preemption
=========	================================	=============	================	================	========	===========
normal		Default QoS for every job		7 days		4			200			50		No
rtq		QoS for interactive job			48 hours	4			36			200		No
irq		QoS for interruptable job		7 days		No limit		No limit		200		Yes
shortq		QoS for job with short walltime		30 mins		10			280			250		No
=========	================================	=============	================	================	========	===========


Explanation
-----------

These QoS are applied to the partition ``comp``.

``--qos=normal``

This is the QoS for all the jobs that do not specify a QoS. Jobs that run here won't be interrupted. 


``--qos=rtq``

This is intended to be used by jobs that have an instrument or a real-time scenario and therefore can’t be interrupted and must be available on demand. 
You can only use a few CPUs and GPUs, but jobs will start as soon as possible (before ``normal`` jobs). 



``qos=irq``
This is intended to be used by jobs that are interruptible.
To use the ``irq`` you have to be prepared to either restart from scratch (if the job was short anyway) or restart from a checkpoint.
Jobs will start very quickly and use all the availble resources but may be stopped at short notice to allow ``shortq`` or ``rtq`` jobs to run.

The mechanism to checkpoint depends on the software that you are running.

Please contact us if you have any questions with regards to job checkpointing.


``--qos=shortq``
This is intended to be used by short and uninterruptible jobs. These jobs will run before ``normal`` but the walltime is limited.
 

An example of Slurm GPU job script
==================================

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    #SBATCH --account=<my_account>
    #SBATCH --qos=<irq,shortq,rtq>
    #SBATCH --gres=gpu:<K80,P100,V100>:1
    #SBATCH --ntasks=2

    <GPU processing program>
    
An example Slurm job script
===============================

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    #SBATCH --account=<my_account>
    #SBATCH --qos=<irq,shortq,rtq>
    #SBATCH --ntasks=2

    openmpi/1.10.7-mlx
    mpirun <program>

