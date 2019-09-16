*********************
Requesting an account
*********************

.. attention::
    If you already have an HPC ID account (used to log in to MonARCH), you
    do not need to create a new account.

Overview of the process
=======================

1. Log in to the HPC ID system that manages M3 accounts
2. Create an M3 account
3. Create or join an M3 project
4. Set your M3 account password
5. Log in to M3

1. Log in to the HPC ID system
------------------------------

The HPC ID system manages accounts for M3. Once you have logged in to HPC ID
you can create an account on M3. If you already have a MonARCH account, you
can skip this step.
        
`Log in to the HPC ID system <https://hpc.erc.monash.edu.au/karaage/>`_.

Select your organisation. Starting typing in the search field to initiate the
autocomplete function. Once you've found your organisation, select the
Continue to your organisation button. If your organisation isn't displayed in
the list, skip to the section below: How to request an M3 account via email.

.. image:: /_static/account/01-bootstrap-aaf.png

You will be presented with the login form for the selected organisation. Enter
your authentication credentials for your organisation. The image below
demonstrates the Monash University login service.

.. figure:: /_static/account/03-bootstrap-monash.png

.. important::

    The first time you attempt to access the HPC ID service it will ask you for
    permission to access the information provided by your organisation's login
    process (typically your name and email address). This information will be
    used by the HPC ID service to authenticate you and create your HPC ID
    account. The form may also provide you with a range of release consent
    duration periods, in which case you should select one and select the Accept
    button to proceed.

2. Create an M3 account
-----------------------

Once you've logged in to the HPC ID system you can begin the process of
creating an M3 user account.

Select a username that will be used for your M3 account from the options
available in the drop down list. Hit Select.

.. note::

    You will access your account on the HPC ID system with your organisational
    credentials, but may have a different username and password for your M3
    account.

.. figure:: /_static/account/04-username.png

The next screen is your HPC ID account's home page.

.. figure:: /_static/account/08-join-existing.png

3. Create or join an M3 project
-------------------------------

You require an active project in order to access M3.
M3 projects have codes, typically in the form of *ab12*, or
*character character number number*.
If you have been provided with a project code, click on the Join existing
projects button and enter the code in the search field. If you do not know the
project code, consult your project leader.

If you need to start a new project **do not select the Create project group
button**; email help@massive.org.au instead.

.. note::

    Only staff members can apply to create projects; PhD/RHD students must ask
    their supervisor(s) to apply for a new project.

4. Set your M3 account password
-------------------------------

Select the option below that applies to you to proceed and set your M3 account
password.

I created my account via the HPC ID system
++++++++++++++++++++++++++++++++++++++++++

If this is the first time you have requested a Monash HPC cluster account
through the HPC ID system, you will have to set your M3 password in order to
log in to M3. Note that this password is NOT the same as your organisational
login password, it is specific to the HPC systems. Never disclose your password
to anyone, including the MASSIVE helpdesk! To change your password, select the
Change Linux Password button in the right hand panel of your account Home page.
This is your HPC password, to be used for HPC services including SSH access
for M3 (i.e. once your request for an account has been approved). Note that
MASSIVE does not store your organisational password through the AAF login.

I requested my account via email
++++++++++++++++++++++++++++++++

If you submitted your request for an account via email, the HPC team will have
provided you with your username in the email response to your request. To get
your password, you must contact the helpdesk by phone on 03 990 24845.

The HPC team strongly recommend you change your preset password at the earliest
opportunity. There are two ways to change your password:

- Log in to M3 using SSH and change your password using the ``passwd`` command
- Connect to M3 using Strudel desktop client, open a terminal and use the ``passwd`` command.

5. Log in to M3
---------------

Once your account has been provisioned you will receive an email from the
MASSIVE helpdesk with further instructions.

See also the :ref:`Connecting to M3<connecting>` page, which includes
instructions regarding software that you may need to install in order to
connect to M3.

If you encounter any issues, contact the `MASSIVE helpdesk <help@massive.org.au>`_.

Request an M3 account via email
-------------------------------
You should only use this option if your organisation doesn't display in step 1
above. Email the `MASSIVE helpdesk <help@massive.org.au>`_ with the following
details:

- Subject line: Request for account on M3
- Your full name
- Your organisational email address
- Name of the organisation
- Contact number (office telephone)
- Your preferred username (this should be based on your name, e.g. jsmith, jocelines, smithj)
- Project code for the project you wish to join (if known)

You will receive an email response within two business days. If your request
has been approved, the message will include your new M3 username. To get your
password, you must contact the `MASSIVE helpdesk <help@massive.org.au>`_
by phone on 03 990 24845.
