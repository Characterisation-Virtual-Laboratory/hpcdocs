.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance.

.. |clustername| replace:: M3

.. _transferring:

***************************************
Copying files to and from |clustername|
***************************************

To copy files to and from |clustername|, see the appropriate section below.

.. contents::
    :local:
    :depth: 2

GUI Tool - Windows, Mac OS, and Linux Users
===========================================

The M3 staff like to use `FileZilla <https://filezilla-project.org/>`_. FileZilla is available for Windows, Mac OS and Linux.
Many SFTP clients are available, the list depends on the platform you use. Here are a few others:

- FileZilla - https://filezilla-project.org/
- WinSCP - https://winscp.net
- Cyberduck - https://cyberduck.io

The following instructions are based around FileZilla.

FileZilla
---------

Obtain FileZilla

1. Navigate to https://filezilla-project.org/ and click on ``Download``

.. image:: /_static/FileZilla_website.png
   :alt: FileZilla main

2. Once downloaded, install the application on your machine.

.. note:: On Windows the installer may also attempt to install WinZip and Opera. Make sure you deselect the checkbox if you don't want these applications.

3. Start up FileZilla.

.. note:: On Windows the look of the program will be different to the screen shots below but the location of buttons and fields is similar.

4. In FileZilla click on the ``Site-Manager`` button.

.. image:: /_static/FileZilla_site-manager.png

5. Click on ``New Site`` and create a new site for M3.

.. image:: /_static/FileZilla_new-site.png

6. Complete the following fields and click on Connect.

- Protocol:   SFTP SSH File Transfer Protocol
- Host:       ``m3.massive.org.au``
- Logon Type: Ask for Password
- User:       Enter your M3 username

7. Enter your password.

.. image:: /_static/FileZilla_password.png

8. FileZilla will connect to your home account on M3. Assuming everything went well you can now drag and drop files into M3.


Command Line Interface - Linux and OS X Users
=============================================

rsync
-----
Use ``rsync`` to synchronise file systems and to transfer large amounts of files, with the ability to stop and restart
the file transfers. ``rsync`` will replicate all files in a folder from one spot to another. It first analyses both
file systems to find the difference and then transfers only the changes.

A typical command to synchronise files from M3 to a local folder is:

.. code-block:: bash

    rsync -auv -e ssh adirectory username@m3-dtn.massive.org.au:~/destinationdirectory/

``rsync`` is very powerful and has many options to help transfer data. For example it can delete unwanted files (``--delete``),
compress data before transfer (``-z``) or can you let you see what command options might do without actually executing them
(``--dry-run``). For more info on ``rsync`` try ``man rsync``.
