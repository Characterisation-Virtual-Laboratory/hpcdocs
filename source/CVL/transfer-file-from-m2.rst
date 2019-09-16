.. |clustername| replace:: M3

.. _transferringm2m3:

***************************************
Copying files to |clustername| from M2
***************************************

To copy files from M2 to |clustername|

.. contents::
    :local:
    :depth: 2

Connect to Data Transfer Node on M3 to do your rsync or scp

Login to `m2.massive.org.au`, then run command:

.. code-block:: bash

	rsync -auv -e ssh somedirectory {username}@m3-dtn.massive.org.au:~/{project_dir}
	
Note that:
    - `username` on M3 may not be the same as on M2.
    - `project_dir` is a symlink to your M3 project directory within your M3 home directory.