.. _lustre_quickstart:

***********************************
Lustre File System Quickstart Guide
***********************************

About Lustre
============

.. attention::
    This content is still under development. Please check back again shortly.

Lustre is a parallel filesystem that is highly scalable and it is a shared filesystem for your ``/projects`` and ``/scratch`` directory.

Lustre servers consist of two major components: **Metadata** and **Object Storage**.

One or more metadata servers (MDS) nodes that has one or more metadata target (MDT) devices are assigned to store namespace metadata, such as filenames, directories, access permissions, and file layout. One or more object storage server (OSS) nodes store file data on one or more object storage target (OST) devices.
Lustre software presents the OSTs as a single unified filesystem.

On M3, ``/projects`` is made up of 10 OSTs and each OST has a space of 29TB and this is the space for you to store your primary data.

``/scratch`` is presented for you to store reproducible data, this space is often bigger than your ``/project`` space and is not backed-up.

One of the benefits of using Lustre is file striping, which means files can be divided into chunks that are written or read simultaneously across a set of OSTs within the filesystem. The chunks are distributed among the OSTs using a method that ensures load balancing.

For both ``/projects`` and ``/scratch`` directories, we have set the default stripe count for all directories to 1.

To find out the stripe info on your file, you may use **lfs getstripe** command, e.g.:

.. code-block:: bash

	lfs getstripe /projects/pMOSP/gins/dd-baseline01

If you have a directory that consists of files that are larger than 100GB, please consider striping your files across two or more  OSTs; to assign an appropriate stripe count, use the command:

.. code-block:: bash

	lfs setstripe -c 2 /projects/pMOSP/gins/

Only files created **after** running this command will have the new stripe settings. 

For more information about how to do file striping on Lustre, please contact help@massive.org.au, detailing the directory to be striped and suggestions will be provided to you.

In order to use Lustre in a more efficient way, avoid having a lot of small files inside a directory. A better practice is to split a large number of files (in the thousands or more) into multiple subdirectories to minimize the contention to the metadata servers.

We have enforced quota on both ``/projects`` and ``/scratch`` directories. To find out your project usage:

.. code-block:: bash

	lfs quota -g {project_id} /projects

	lfs quota -g {project_id} /scratch
