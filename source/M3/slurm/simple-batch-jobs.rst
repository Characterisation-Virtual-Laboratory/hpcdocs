.. _Quick Start:
.. _simple-batch-jobs:

***********
Quick Start
***********

A submission script is a shell script that consists of a list of processing tasks that need to be carried out, such as the command, runtime libraries, and input and/or output files for the tasks. If you know the resources that your tasks need to consume, you may also modify the SBATCH script with some of the common directives, e.g.: 

.. code-block:: bash

	Short Format	Long Format		Default		Description
	------------	-----------		-------		-----------
	-N count 	--nodes=count		One		One node will be used.	Used to allocate count nodes to your job.
	-A accountID 	--account=accountID	One		Enter the account ID for your group. You may check your available account(s) with id command.
	-t HH:MM:SS	--time=HH:MM:SS		02:00:00	Always specify the maximum wallclock time for your job, max is 7 days.
	-p partition	--partition=partition	m3a		Always specify your partition (i.e. m3c, m3d, m3f)
	-n count	--ntasks		One		Controls the number of tasks to be created for the job
	N/A		--ntasks-per-node	One		Controls the maximum number of tasks per allocated node
	-c count	--cpus-per-task		One		Controls the number of CPUs allocated per task
	N/A		--mem-per-cpu		4096MB		Memory size per CPU
	-m size		--mem=size		4096MB		Total memory size
	-J jobname	--job-name=job_name	slurm-{jobid}	Up to 15 printable, non-whitespace characters
	N/A		--gres=gpu:1		N/A		Generic consumable resources e.g. GPU
	N/A		--no-requeue		--requeue	By default, job will be requeued after a node failure


*************************
Running Simple Batch Jobs
*************************

Submitting a job to SLURM is performed by running the ``sbatch`` command and specifying a job script.

.. code-block:: bash

    sbatch job.script

You can supply options (e.g. ``--ntasks=xx``) to the ``sbatch`` command. If an option is already defined in the ``job.script`` file,
it will be overridden by the commandline argument.

.. code-block:: bash

    sbatch [options] job.script

An example Slurm job script
===========================

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    #SBATCH --account=nq46
    #SBATCH --time=01:00:00
    #SBATCH --ntasks=1
    #SBATCH --mem-per-cpu=4096
    #SBATCH --cpus-per-task=1
    ./helloworld

This script describes the job: it is a serial job with only one process (``--ntasks=1``). It only needs one CPU core to run the ``./helloworld`` process.
The default memory per CPU has been set to 4GB and you should adjust the script based on how much your job needs.

Cancelling jobs
===============
To cancel *one* job

.. code-block:: bash

    scancel [JOBID]


To cancel *all* of your jobs

.. code-block:: bash

    scancel -u [USERID]
