.. _mx_v1:

.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance, or have suggestions to improve this documentation.


**************************************
DRAFT Instructions for MX2 Eiger Users
**************************************

M3 is available to users associated with MASSIVE partners for transferring and processing Eiger
data. Please follow these instructions to get started.


Access to MX data through CAP projects on M3
============================================

MASSIVE will create a mirror of MX CAP projects. This project will allow CAP researchers to access MX
CAP data, using a documented set of instructions, for the period of the CAP and up to a period after.
We intend these projects for data access only and we would like to suggest that you create a
dedicated research lab-focused and long-lived project for the bulk of your data processing.

To check which CAP projects you are part of, please go to https://hpc.erc.monash.edu.au/karaage and log
in using an Australian Access Federation (AAF) account. After logging in successfully, please select the
**"Projects"** tabs on the left panel; you will find a list of your projects under **"Projects I am a member of"** section.

CAP members must request access. Please follow these instructions to create an account and request
access to an existing CAP project but replace m3earlyadopters with your project code:
http://docs.massive.org.au/M3/requesting-an-account.html

.. important::

    CAP leaders: The invite function does not currently work. Please *DO NOT* send invites to your project
    members; instruct them to use the instructions on this page.

Create a research lab project for your research lab
===================================================
M3 use is organised into projects that are lead by a project lead. The
project lead is responsible for managing users within the project and communicating
with the MASSIVE team about allocations and project reporting. We recommend
that M3 projects are lead by research laboratory leads.

M3 projects are not the same as CAP projects; research laboratory leads must apply
for a separate M3 project to process MX data.

If your group already has an M3 project, proceed directly to the next section.

To request an M3 project:

1. Fill out the following project request form
2. The MASSIVE team will email your project team members with instructions on how to create an account and join your project.

.. important::

    Creating projects and user accounts takes around 48 hours, or 2 business
    days. If you do not receive a confirmation email within 48 business hours,
    please contact the MASSIVE help desk at help@massive.org.au

Getting started on M3
=====================

Please look over http://docs.massive.org.au/ to get acquainted with the M3 system.

Alternatively, the MASSIVE team are happy to schedule on-boarding sessions for lab groups. Please email help@massive.org.au to organise a session.

.. _connecting_xds:

Connecting to M3
================

Connect to M3 and start a shell/terminal session. This can be done in one of three ways. Please see :ref:`connecting` for details on each of these options.

    - SSH into m3.massive.org.au as per instructions at :ref:`ssh`
    - Log in to a desktop session using Strudel as per instructions at :ref:`strudel`
    - Log in to a desktop session through the web using https://desktop.massive.org.au.

Users who have logged in using a desktop session will need to launch a terminal. This can be done by doubling clicking on the terminal icon, shown below.

In the terminal that you have just opened, enter:

.. code-block:: bash

    module load xds/slurmenabled


Transfer your MX data
=====================

Begin by connecting to m3.

Transferring data from the Australian Synchrotron is a two step process. The
first step is to setup passwordless access for your M3 account to access the AS
data server (this needs to be done only once). The second step is to synchronise
the appropriate data sets from AS to your M3 account.

Setting up passwordless access
------------------------------

Use the command

.. code-block:: bash

  ssh-copy-id <username>@sftp.synchrotron.org.au


where `username` is your Australian Synchrotron username (probably an email address)
Note that this command probably includes the `@` symbol twice, once in the AS
username (which is an email address) and once in the `@sftp.synchtron.org.au` part.

You will then be prompted to enter your Australian Synchrotron password (not your M3
password).

Transferring your data
----------------------

If you wish to synchronise only once (because you know the data is not changing)
use the flag `--once` as in the example below


.. code-block:: bash

  syncsync.py --username=<username> --path=<epn> --once


For example, the two commands below are used to transfer ``user1``'s' ``frames`` and ``homes`` folders  from epn ``123456a`` to M3 once

.. code-block:: bash

  syncsync.py --username=user1@example.com --path=123456a/frames/user1 --once
  syncsync.py --username=user1@example.com --path=123456a/homes/user1 --once


If you need to do continuous data sync, because you are still expecting more data from the instrument, run the command without the `--once` tag

.. code-block:: bash

  module load xds/slurmenabled
  syncsync.py --username=user1@example.com --path=123456a/frames/user1
  syncsync.py --username=user1@example.com --path=123456a/homes/user1

These commands will continuously loop looking for changes in the AS data store and
synchronising the `homes` and `frames` folders to M3.

For more general information on transferring data, please see :ref:`transferring`

If you have data stored on a portable hard drive and are finding it difficult to upload your data to M3, please email help@massive.org.au to organise a time to drop off your hard drive. We will then upload the data to M3 for you.

.. important::

    The data transfer may take around 10 to 12 hours depending on the size of dataset. We recommend the use of ``tmux`` before running the commands to start the transfer. Please email help@massive.org.au if you need help with running ``tmux``.


Process your data
==================

Change to the directory that contains your data for XDS processing:

.. code-block:: bash

    cd <path>

Examine the ``XDS.INP`` file in this directory, and verify that these values are present to take maximum advantage of M3:

.. code-block:: bash

    MAXIMUM_NUMBER_OF_JOBS=4
    MAXIMUM_NUMBER_OF_PROCESSORS=24
    LIB= /usr/local/xds/20170302/lib/dectris-neggia-centos7.so

You might also wish to include these values as recommended by the MX Beamline scientists

.. code-block:: bash

    JOB=ALL
    FRIEDEL\'S_LAW=FALSE


If there is no ``XDS.INP`` file present, please consult your lab head or colleagues.

Fix the symlink to the ``img`` folder:

.. code-block:: bash

    unlink img
    ln -s <path-to-data> img

Run the command ``xds_par`` and wait for the process to finish. You will be returned to your terminal prompt. The output of the command is displayed on the terminal screen and is also stored in ``xds_stdout`` file in the same folder where ``xds_par`` was run.


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
    module load xds/slurmenabled
    xds_par
