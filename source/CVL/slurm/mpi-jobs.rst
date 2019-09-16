.. _mpi-jobs:

****************
Running MPI Jobs
****************
The Message Passing Interface (``MPI``) is a library specification for message-passing. It is a standard API
(Application Programming Interface) that can be used to create parallel applications. An MPI job can considered as a
cross-node and multi-process job.


An example Slurm MPI job script
===============================

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    ... ...
    #SBATCH --ntasks=32
    #SBATCH --ntasks-per-node=16
    #SBATCH --cpus-per-tasks=1
    ... ...
    module load openmpi-gcc
    mpiexec <program>

This script tells Slurm this is a multi-processing job. It has 32 MPI processes, with 16 MPI processes on each
node (implicitly requesting 2 nodes). For each MPI process, it needs 1 CPU core.
