.. _interactive-jobs:

************************
Running Interactive Jobs
************************

Submitting an Interactive Job
-----------------------------

Interactive sessions allow you to connect to a compute node and work on that node directly. This allows you to develop
how your jobs might run (i.e. test that commands run as expected before putting them in a script) and do heavy development
tasks that cannot be done on the login nodes (i.e. use many cores).

To launch an interactive job on MASSIVE, use the ``smux new-session`` command. Please note it will launch the job with the
following defaults:

    - ``--ntasks=1`` (1 cpu core)
    - memory=4G
    - time=2 hours
    - no other resources such as GPU

``smux`` has a complete help available by typing ``smux -h`` or just ``smux``. Commands such as ``new-session`` and ``attach-session`` can be abbreviated to ``n`` and ``a``. It is designed to mirror the options used  by ``tmux``.


If you have a reservation and your reservation nodes are not in the default partition

.. code-block:: bash

    smux new-session --reservation=hpl --partition=m3c

If you want to change default time to 2 days

.. code-block:: bash

    smux new-session --time=2-00:00:00

If you need multi-core

.. code-block:: bash

    smux new-session --ntasks=12

If you need two GPU cards

.. code-block:: bash

    smux new-session --ntasks=2 --gres=gpu:2 --partition=m3c


Available partitions:

=========  	============  	=========
Partition       Types of GPU   	Per node 
=========  	============  	========= 
m3c  		K80  		4 
m3h   		P100  		2
=========  	============  	=========


If the job launches immediately (as it should most of the time) you will be connected automatically. If it does not launch immediately, you can use ``smux attach-session`` or just ``smux a`` once it hast started.

How long do interactive jobs last for?
--------------------------------------
Interactive Jobs will remain active until "exit" or the job is cancelled

The mechanism behind the interactive job is:

    - User runs the ``smux new-session`` command
    - ``smux`` schedules a Slurm batch job to start a ``tmux`` session on a compute node
    - Slurm grants the user ``ssh`` access to the node
    - ``smux attach-session`` connects the user to the node and attaches to the ``tmux`` session
    - The job is completed whenever the ``tmux`` session ends or the job is cancelled
    - Therefore, an interactive job will not be automatically terminated unless the user manually ends the session.

To end a session:

    - Option 1: Run ``exit`` on the compute node. This terminates the ``smux`` job and returns you to the login node.
    - Option 2: Cancel the job directly (from compute nodes or login nodes) using ``scancel [JOBID]``.

Reconnecting to/Disconnecting from an Active Interactive Job
------------------------------------------------------------
Since an interactive job is a ``tmux`` session, you can reconnect to/disconnect from it at any time. Here is a real-world scenario.

I am in the office and have an interactive job running (ID#70064). Now I plan to go home but I want to leave this
job running so I can reconnect to it when I am home. The steps are:

1) Disconnect the screen session for the existing interactive job. You can either just close your laptop or the terminal and walk away, or type "ctrl-b d" (That is, hold the ctrl key, and press the b key, release both keys then press the d key) (ctrl-b is the standard tmux escape sequence, it can be changed)


2) Now ``show_job`` to see if the job is still running:

.. code-block:: bash

	JOBID          JOB NAME     Project         QOS      STATE    RUNNING      TOTAL   NODE                   DETAILS
                                                                 	TIME       TIME
	------------------------------------------------------------------------------------------------------------------
	70064         _interact     default      normal    Running         7   1-00:00      1                      m3a009

3) Once I am home, I can reconnect

.. code-block:: bash

    m3-login1:~ ctan$ smux a

*Note: to access to the cluster node, first you need to ssh to the login nodes*

Please visit :ref:`connecting` for more information

4) Continue working until the wall-time limit is reached, or I end the job.
