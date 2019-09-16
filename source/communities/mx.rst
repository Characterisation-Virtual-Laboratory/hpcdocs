.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance, or have suggestions to improve this documentation.

**************************************
DRAFT Instructions for MX2 Eiger users
**************************************
This document supersedes earlier instructions on how to download your MX2 data
without assistance from the MASSIVE team.
Earlier instructions are preserved here :ref:`MX Eiger V1 instructions <mx_v1>`.

The MASSIVE team can now download the
data on your behalf and store the data without counting it towards your disk
quota. This document also updates and simplifies the procedure for setting up
for reprocessing data. M3 is available to users associated with MASSIVE partners
for transferring and processing Eiger data. Please follow these instructions to
get started.

The Big Picture
===============

With recent detector upgrades, the MX beamline has started to produce a
relatively high data rate. As archival storage is considerably cheaper than
using high speed file systems for data storage, the MASSIVE team aims to help
high data rate producers in two primary ways:

1. By making an archival copy of all their data 
2. While continuing to make it available on a high speed file system for processing

The following process is designed to limit the length of time that data is kept
available on the high speed file system by moving it to archival storage, with
the option of retrieving it again latter.

1. The MASSIVE team creates one project per each data producer. In the case of MX data at Monash, this means one project for each Monash CAP.
2. The MASSIVE team creates an additional project for each research subgroup to do their work. There may be one or more research projects per CAP.
3. Each CAP leader authorises the MASSIVE team to download data from the Australian Synchrotron on their behalf (see the section :ref:`Authorising MASSIVE to download your data <authorising_massive>`).
4. The MASSIVE team downloads a copy of each experiment to the M3 high performance file system, and makes this data readable to the appropriate users.
5. The MASSIVE team makes additional copies of each experiment to archival storage.
6. After some time (typically around three months) the MASSIVE team removes the copy of data on M3 (preserving the copies on archival storage).
7. Each researcher is able to “symlink” large data files (avoiding taking up additional disk space) and copy smaller input files (allowing them to be changed) and perform re-processing.

.. _authorising_massive:

Authorising MASSIVE to download your data (CAP Leaders only)
============================================================

In order to use this service each CAP leader needs to authorise the M3 service
to download data collected by their CAP for each EA, using the following steps:

1. Open  the Australian Synchrotron Portal (https://portal.synchrotron.org.au)
2. Open the Experiment Application (EA) for your CAP
3. Select Add user and search for the user “Monash Datasynchroniser” with the email address “help@massive.org.au”.

.. note::
  This user needs to be present in the EA for each beam time, but since common 
  practice is to copy the EA from the previous beam time, you should only need
  to do this once. This user does not count for the maximum of 15 users per 
  experiment.

Creating research projects (research lab leaders only)
======================================================

M3 use is organised into projects that are lead by a project lead. The project
lead is usually a research lab leader, although we can be flexible around this, 
and have some projects which consist of a single person rather than a lab; 
please contact us to discuss cases like this. The project lead is responsible 
for managing users within the project and communicating with the MASSIVE team 
about allocations and project reporting. We recommend that M3 projects are lead 
by research laboratory leads.

.. note::
  Note that M3 projects are not the same as CAP projects; research laboratory 
  leads must apply for a separate M3 project to process MX data. If your group 
  already has an M3 project, proceed directly to the next section.

To request an M3 project:

1. Fill out the project request form at https://goo.gl/forms/YtZoTU98ZU9GrlUI2
2. The MASSIVE team will email your project team members with instructions on how to create an account and join your project

Creating projects and user accounts may take up to two business days. If you do
not receive a confirmation email within two business days, contact the MASSIVE
help desk at help@massive.org.au.

Requesting access to M3
=======================
The M3 identity management system is currently undergoing an overhaul designed 
to make it easier for project leaders to authorise collaborators to share access
to their data and resource allocations. In the meantime, follow these steps to 
request access to M3:

1. Go to `the HPC identity managment portal <https://hpc.erc.monash.edu.au/aafbootstrap>`_
2. Enter your University and your university username and password
3. Select a user name
4. Email help@massive.org.au providing:

    1. your user name
    2. which CAP you are a part of
    3. which research subgroup you are a part of (if you are not a leader)

Once the MASSIVE team has finished setting up your account, you will receive an 
email asking you to go back to `the HPC identity managment portal <https://hpc.erc.monash.edu.au/aafbootstrap>`_ and set a password to log in to M3.

Getting started on M3
=====================

Go to http://docs.massive.org.au/ for information to get you started with the 
M3 system. Alternatively, contact help@massive.org.au to schedule an on-boarding
session for your lab group.

Connecting to M3
================
Connect to M3 and start a shell/terminal session. This can be done in one of
three ways. Please see :ref:`connecting` for details on each of these options.

    - SSH into m3.massive.org.au as per instructions at :ref:`ssh`
    - Log in to a desktop session using Strudel as per instructions at :ref:`strudel`
    - Log in to a desktop session through the web using https://desktop.massive.org.au

Users who have logged in using a desktop session will need to launch a terminal,
by double clicking on the terminal icon.

Accessing your MX data
======================

You should find your data located in: ``/scratch/<CAPprojectcode>/<epn>``

``<CAPprojectcode>`` is the project code of your CAP. If you do not know your
project code, you can type ``id`` at the command line and it will list all
projects you are a member of. ``<epn>`` is the Australian Synchrotron EPN number.

.. note:: 
  This copy of the data is read-only and cannot be changed.

Reprocessing your MX data
=========================

1. Use the command ``module load mxtools`` to load a set of tools to assist in reprocessing MX data
2. Create an appropriate directory to store reprocessed output
3. Use the command ``xds_reprocess <autoprocessing directory> <reprocessing directory>``

.. note:: 
  The auto-processing directory contains files generated by the Australian 
  Synchrotron during auto-processing. You will find it somewhere under 
  ``/scratch/<CAPprojectcode>/<epn>/home/<ASUsername>/``. The reprocessing 
  directory can be anywhere you like. We recommend putting it somewhere under 
  ``/projects/<ResearchProjectcode>/<M3Username>``.

Use the commands:

.. code-block:: bash

  module load xds/monash
  xds_par

This will run the command ``xds_par``. Wait for the process to finish. You will 
be returned to your terminal prompt. The output of the command is displayed on 
the terminal screen and is also stored in ``xds_stdout`` file in the same folder
where ``xds_par`` was run.

Recommended Settings
====================

You might also wish to include these values in your ``XDS.INP`` file, as 
recommended by the MX Beamline scientists.

.. code-block:: bash

  JOB=ALL
  FRIEDEL'S_LAW=FALSE

Known Issues
============
	
Cannot open or read filename.tmp error
--------------------------------------
The following error may appear when you are attempting to process data:

.. code-block:: bash

    !!! ERROR !!! CANNOT OPEN OR READ FILE LP_01.tmp

    Presumably, the independent jobs supposed to have been started
    in the COLSPOT step have not run properly. This could be due
    to incomplete installation of XDS where some of the executables
    of the package are not included in the search path.

    !!! ERROR !!! CANNOT OPEN OR READ "mcolspot.tmp"
	
To fix this error, run the ``module purge`` command, followed by reloading the ``xds`` module:
	
.. code-block:: bash

    module purge
    module load xds/monash
    xds_par

Need help?
==========

If you need help or have any queries, contact help@massive.org.au
