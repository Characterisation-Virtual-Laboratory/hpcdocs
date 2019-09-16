.. _multi-threaded-jobs:

****************************
Running Multi-threading Jobs
****************************

Multi-threading is a type of execution model that allows multiple threads to exist within the context of a process.
Simply speaking, a Slurm multi-threading job is a single process, multi-core job. Many application can belong to this category

    - OpenMP programs,
    - Matlab programs with (Parallel Computing Toolbox) enabled,
    - and so on

An example Slurm Multi-threading job script
===========================================

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    ... ...
    #SBATCH --ntasks=1
    #SBATCH --cpus-per-tasks=8
    ... ...
    ./<program>

This script tells Slurm this is a multi-threading job. It has only 1 process, but that process needs 8 CPU cores to execute.
