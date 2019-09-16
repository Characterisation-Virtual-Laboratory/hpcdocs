.. _diagnosing-problems-with-jobs:

*****************************
Diagnosing problems with jobs
*****************************

Pending jobs
------------
There are many reasons why a job may be stuck in ``Pending`` status. In 90% of cases, the ``show_job`` script can assist
you in determining why the job is stuck.

.. code-block:: bash

    show_job

and

.. code-block:: bash

    show_job [JOBID]

It may also be beneficial to check the cluster status

.. code-block:: bash

    show_cluster


CPU, Memory, and Desktop Job Limits
-----------------------------------

M3 is shared by many users. To ensure that every user gets their fare share, a user limit has been applied.
There are limits for CPU cores, memory, and number of desktop jobs. For instance, on M3, each user can only consume 300
CPU Cores at any one time. If this limit is hit, all new jobs will be set to ``Pending``.  This appears in the output of
``show_job`` as ``Reach User Job Limit (CPU)``.

If you encounter this situation, it is very likely that you are consuming a high number of CPU cores. As running jobs complete,
your pending jobs will begin to run.

The ``show_job`` command reports how many CPU cores you are currently using.

.. code-block:: bash

    $ show_job

                          *************************************************
                          *               MY JOB SUMMARY                  *
                          *               Cluster:    m3                  *
                          *************************************************
                            User Name                        Massive User
                            User ID                                masusr
                          -------------------------------------------------
                            Num of Submitted Jobs                       0
                            Num of Running Jobs                         0
                            Num of Pending Jobs                         0
                            Num of CPU Cores                           20
                          -------------------------------------------------


                          *************************************************
                          *               Job Details on m3               *
                          *************************************************

    JOBID          JOB NAME     Project         QOS      STATE    RUNNING      TOTAL   NODE                   DETAILS
                                                                     TIME       TIME
    ------------------------------------------------------------------------------------------------------------------

Job Submission rejected
-----------------------

The slurm scheduler is configured to check your allocation during job submission, to ensure that you have enough CPU hours
to complete all current jobs as well as the newly submitted job. Slurm will reject a job submission if:

Insufficient project credit is available to run the job
+++++++++++++++++++++++++++++++++++++++++++++++++++++++

For example: A user has 1000 CPU hours available in their project. The user submits a job with a wall-time of 2000 CPU
hours. Slurm will reject the job and an error message will appear:

.. code-block:: bash

    ------------------------------------------------------------------------
                     Insufficient Credit!
                Job Requires 2000 (CPU mins)
       Project 'xxx' Only has 1000 (mins) Available
       Please Contact MASSIVE Helpdesk: help@massive.org.au
    ------------------------------------------------------------------------

A large number of jobs are submitted and total walltime exceeds available credit
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

For example: A user project has 20k CPU hours available. The user submits 2000 jobs, each requesting 100 CPU hours. This
requests a total of 200k CPU hours.

Slurm will check all jobs that uses this project account (Running or Pending) and reserve the CPU hours of each job. The actual usage credit of the account is calculated as:

``Usable_Credit`` = ``Project_Available_Credit`` - ``Reserved_Credit``

.. code-block:: bash

    Submit 1 job   ->  Usable_Credit=19900
    Submit 2 jobs ->  Usable_Credit=19800
    ......
    Submit 199 jobs ->  Usable_Credit=100
    Submit 200 jobs ->  Usable_Credit=0
    Submit 201 jobs ->  Reject
    Submit 202 jobs ->  Reject

After Job #201, the user will be notified that they have insufficient credit:

.. code-block:: bash

    ------------------------------------------------------------------
                     Insufficient Credit!
    ------------------------------------------------------------------
                This Job Requires 100 (CPU mins)
           Project 'xxx' has 20000 (mins) Available
           Existing Jobs are Consuming 20000 (mins)
       Account has 0 (mins) for New Job Submission
       Please Contact MASSIVE Helpdesk: help@massive.org.au
    ------------------------------------------------------------------
