.. _project-credit-management:

******************
Project Allocation
******************

Resources on CVL\@MASSIVE are allocated by the SLURM job scheduler. Unlike M1 & M2, on M3
we use the SLURM multifactor plugin to assign priorities to jobs. This means
that the scheduler sets priority based upon job age, queue, partition, job size,
QoS and fair-share.

Slurm’s fair-share factor is a scoring system that reflects the shares of a
computing resource that a user has been allocated and the number of
computing resources the user’s jobs have consumed. The fair-share component
to a job’s priority influences the order in which a user’s queued jobs are
scheduled to run.

The MASSIVE team is working on a mechanism to represent this score in a more
meaningful way.

Please refer to SLURM documentation for more information: https://slurm.schedmd.com/priority_multifactor.html#fairshare

Project Space
+++++++++++++

To check your quota on /projects

.. code-block:: bash

	lfs quota -h -g "project_id" /projects

and to check your quota on /scratch

.. code-block:: bash

	lfs quota -h -g "project_id" /scratch

Please also visit the link below for more information about our filesystem:

http://docs.massive.org.au/M3/file-systems-on-M3.html


Questions about allocation
++++++++++++++++++++++++++

If you have any enquiries with regards to your project resources and space
allocation, please do not hesitate to contact us on help@massive.org.au

