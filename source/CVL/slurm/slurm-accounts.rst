.. _slurm-accounts:

**************
Slurm Accounts
**************

Slurm accounts are used to account for CPU/GPU usage, as well as setting job
priorities, and are an important part of the job scheduler. Each M3 project has
a corresponding Slurm account.

Default accounts
++++++++++++++++

Some users on CVL\@MASSIVE will have a single project, which means that they'll have a
single project code and won't need to specify an account. Other users will have
multiple projects, which means they'll have multiple Slurm accounts and may need
to specify an account.

To view your default slurm account:

.. code-block:: bash

    sacctmgr show user $USER format=User,DefaultAccount

To change your default slurm account:

.. code-block:: bash

    # Replace nq46 with your account code
    sacctmgr modify user where name=$USER set DefaultAccount=nq46

Setting the account for a job
+++++++++++++++++++++++++++++

Depending on how you're accessing M3, the mechanism for setting the account to
charge a job to changes:

sbatch and smux
---------------

To specify an account for ``sbatch`` and ``smux`` jobs, use the ``-A`` or
``--account`` option:

.. code-block:: bash

    sbatch --account nq46 job.script
    # OR
    sbatch -A nq46 job.script

.. code-block:: bash

    smux new-session --ntasks=12 --account=nq46
    # OR
    smux new-session --ntasks=12 -A=nq46

Strudel Desktop
---------------

To specify an account for Strudel Desktop, enter the account code in the
*Project* box:

.. image:: /_static/strudel-desktop-account.png


Strudel Web
-----------

To specify an account for `Strudel Web <https://desktop.cvl.org.au>`_, when
requesting a desktop, use the drop down menu in the *Launch a desktop* section.

.. image:: /_static/strudel-web-account.png

Questions about slurm accounts
++++++++++++++++++++++++++++++

If you have any enquiries with regards to your project resources and Slurm
accounts, please do not hesitate to contact us on help@massive.org.au

