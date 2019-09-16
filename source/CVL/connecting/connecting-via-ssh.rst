.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance.

.. |clustername| replace:: CVL\@MASSIVE

.. _ssh:

***********************************
Connecting to |clustername| via ssh
***********************************

To connect to |clustername|, you will be required to use ``ssh``. If you're already confident with the command line, you can
simply ``ssh`` into |clustername| using your HPCID username and password.
::

    ssh username@m3.massive.org.au

If you need further instructions, consult the relevant section below for your Operating System.

.. contents::
    :local:


Linux and OS X Users
====================
To connect to |clustername|, Linux and OS X users need to start a terminal session. The process is very similar, however
OS X users may need to take some additional steps.

.. note:: OS X Users:
    To start a terminal session, in Finder, navigate to Applications > Utilities and double
    click on Terminal.app

Once you have launched a terminal session, execute either one of the following commands:

.. code-block:: bash

    ssh -l username m3.massive.org.au

.. code-block:: bash

    ssh username@m3.massive.org.au

Enter your password at the prompt and you will be directed to the login node. If this is the first time that you have
logged into |clustername|, you will be asked if you wish to accept the host key of the node you are connecting to. This is just an
identifier for the login node. Enter ``yes`` at the prompt and you will not be asked again; the login node's credentials
will be stored on your local system.

X11 port forwarding
___________________
To enable X11 port forwarding the ``-Y`` or ``-x`` flag is required when you use the ``ssh`` command, depending upon which
version of ``ssh`` you have installed on your system.

.. code-block:: bash

    ssh -l username m3.massive.org.au -Y

To test that the session supports port forwarding, use the ``xclock`` or ``xeyes`` command.

.. note:: OS X Users:
    To enable X11 port forwarding OS X users using OS X 10.4 and above need to install the `XQuartz <https://www.xquartz.org>`_ application as X11 is
    `no longer shipped with OS X <https://support.apple.com/en-au/HT201341>`_.

Windows Users
=============

The recommended software is Putty which is available from: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

Note: if you are connected to the Monash network, you must download the ``zip`` file and *not* the ``exe`` file.
