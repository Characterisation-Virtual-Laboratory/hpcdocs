.. _array-jobs:

******************
Running Array Jobs
******************
Job arrays allow you to run a group of identical/similar jobs. The Slurm script 
is EXACTLY the same. The only difference between each sub-job is the environment
variable, ``$SLURM_ARRAY_TASK_ID``. So it can be a good idea if you want to do 
some data level parallelization. E.g. let sub-job 1 ``(SLURM_ARRAY_TASK_ID=1)`` process data chunk 1, sub-job 2 processes data chunk 2, ... etc.

To do that, just add the following statement in your submission script, where ``n`` is the number of jobs in the array:

.. code-block:: bash

    #SBATCH --array=1-n

An example of Slurm Array job script
====================================

.. code-block:: bash

    #SBATCH --array=1-20

Or you can specify an array job at submission time, without modifing your submission script:

.. code-block:: bash

   sbatch --array=1-20 job.script

In Slurm, the job array is implemented as a group of single jobs. E.g. if you 
submit an array job with #SBATCH --array=1-4. When the starting job is ID=1000, the ids of all jobs are: 1000, 1001, 1002, 1003.

Note: There is a limit of 1000 jobs per array. Slurm also has a bug where it 
will not allow array id's above this limit, this can be worked around with a 
prefix in the script (e.g. for "1001-1020" use --array=01-20 and reference 
variables with a prefix 10$SLURM_ARRAY_TASK_ID)

A maximum number of simultaneously running tasks from the job array may be 
specified using a "%" separator. For example "--array=0-15%4" will limit 
the number of simultaneously running tasks from this job array to 4.
