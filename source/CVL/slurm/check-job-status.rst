.. _check-job-status:

.. warning::
    This command is not yet implemented on M3. Please check the message of the day (MOTD) displayed at login to see
    which system commands are currently implemented on M3.

*******************
Checking job status
*******************

There are two methods to check your job status.

Method 1: ``show_job``
----------------------
We provide a ``show_job`` script. This script groups information, filters, sorts, and provides statistics to provide
a clean, tidy, and user-friendly output.

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
                            Num of CPU Cores                            0
                          -------------------------------------------------


                          *************************************************
                          *               Job Details on m3               *
                          *************************************************

    JOBID          JOB NAME     Project         QOS      STATE    RUNNING      TOTAL   NODE                   DETAILS
                                                                     TIME       TIME
    ------------------------------------------------------------------------------------------------------------------

.. hint::
    To check the status of a single job use ``show_job [JOBID]``.

Method 2: Slurm commands
------------------------

To display all of your running/pending jobs use ``squeue -u `whoami```.

.. hint::
    ``whoami`` returns your M3 username, and is a handy shortcut.

.. code-block:: bash

    $ squeue -u `whoami`
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)

If you want to view the status of a single job

.. code-block:: bash

    $ scontrol show job [JOBID]

