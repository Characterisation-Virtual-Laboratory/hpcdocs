***************************
Running jobs on CVL\@MASSIVE
***************************

Launching jobs on M3 is controlled by SLURM, the `Slurm Workload Manager <http://slurm.schedmd.com>`_, which allocates
the compute nodes, resources, and time requested by the user through command line options and batch scripts. Submitting and
running script jobs on the cluster is a straight forward procedure with 3 basic steps:

    - Setup and launch
    - Monitor progress
    - Retrieve and analyse results

For more details please see:

.. toctree::
    :maxdepth: 2

    check-cluster-status
    slurm-accounts
    simple-batch-jobs
    mpi-jobs
    multi-threaded-jobs
    interactive-jobs
    gpu-jobs
    array-jobs
    using-qos
    check-job-status
    project-credit-management
