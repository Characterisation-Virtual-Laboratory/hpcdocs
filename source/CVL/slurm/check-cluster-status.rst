.. _Partitions_Available:
.. _check-cluster-status:

********************
Partitions Available
********************

Nodes belong to different partitions which allow corresponding jobs to run on them. There are two partitions on m3 at the moment:

        The default partition is ``comp`` which consists of:

        - m3a:  21 nodes, each with 24 cores plus 128GB RAM
.. - m3c:  13 nodes, each with 24 cores, 4 x nVidia Tesla K80, 256GB RAM
        - m3d:  13 nodes, each with 24 cores, 256GB RAM
        - m3h:  14 nodes, each with 28 cores, 2 x nVidia Tesla P100, 256GB RAM
        - m3i:  43 nodes, each with 36 cores, 196GB RAM

..	- m3g:  20 nodes, each with 36 cores, 3 x nVidia Tesla V100, 384GB RAM

        The default partition for desktop is ``desktop``:

        - m3c:  13 nodes, each with 24 cores, 4 x nVidia Tesla K80, 256GB RAM
        - m3f:  32 nodes, each with 3 cores, 1 x nVidia Grid K1, 16GB RAM
        - m3h:  10 nodes, each with 28 cores, 2 x nVidia Tesla P100, 256GB RAM

****************
Other partitions
****************

    - short:
        - use this when the jobs can be completed within ten minutes
        - two nodes, each with 24 cores, 100GB RAM

    - rtqp:
        - real-time partition to be used on demand
        - batch jobs shouldn't be running here
        - use this partition only with two QoS, rtq and irq
        - ten nodes, a total of 412 cores, three nodes with V100 and one node with P100

**********************************
Checking the status of CVL\@MASSIVE
**********************************

On M3, users can check the status of all nodes via the ``show_cluster`` command. The output of this command should be similar to:

.. code-block:: bash

    $ show_cluster
	NODE            TYPE      PARTITION*         CPU     Mem (MB)   GPU/Phi         STATUS
        	                                  (Free)       (Free)    (Free)
	---------------------------------------------------------------------------------------
	m3a000           CPU         m3a/all        (24)     (116588)     (N/A)       Reserved
	m3a001           CPU         m3a/all        (24)     (116588)     (N/A)       Reserved
	m3a002           CPU         m3a/all        (24)     (116588)     (N/A)       Reserved
	m3a003           CPU         m3a/all          24       116588       N/A           Idle
	m3a004           CPU         m3a/all          24       116588       N/A           Idle
	m3a005           CPU         m3a/all          24       116588       N/A           Idle
	m3a006           CPU         m3a/all          24       116588       N/A           Idle
	m3a007           CPU         m3a/all          24       116588       N/A           Idle
	m3a008           CPU         m3a/all        (24)     (116588)     (N/A)       Reserved
	m3d007           CPU         m3d/all           8        15614       N/A        Running
	m3d008           CPU             m3d           8        15614       N/A        Running

The STATUS field explained
--------------------------
The ``STATUS`` field can show:

    - Idle - Node is completely free. No jobs running on the node.
    - Running - Some jobs are running on the node but it still has available resources for new jobs.
    - Busy - Node is completely busy. There are no free resources on the node. No new jobs can start on this node.
    - Offline - Node is offline and unavailable due to a system issue.
    - Reserved - Node has been booked by other users and is *ONLY* available for them.
