**************************
Frequently asked questions
**************************


.. contents:: :local:


========
Accounts
========

**How do I apply for an account on M3?**

* `Create an M3 account <http://docs.massive.org.au/M3/requesting-an-account.html>`_

**How do I apply for an account on M3 if my organisation isn’t an AAF member?**

* Email the `MASSIVE helpdesk <help@massive.org.au>`_ and it will reply to you with further instructions

====
Jobs
====

**How to check the status of my submitted job or when it’s estimated to start?**

* `Checking job status <http://docs.massive.org.au/M3/slurm/check-job-status.html?highlight=job%20status>`_

**How long should sinteractive take to schedule?**

* Jobs may start within seconds or take several days depending on the size of the job and current resource availability
* For further information go to `Checking job status <http://docs.massive.org.au/M3/slurm/check-job-status.html?highlight=job%20status>`_

**How long should my job wait in the short queue?**

* The short queue is for short jobs only, so you can expect your job to start within minutes. If a job in the short queue takes longer than 24 hours to start, contact the `MASSIVE helpdesk <help@massive.org.au>`_

**Why isn’t my job running?**

* `Diagnosing problems with jobs <http://docs.massive.org.au/M3/slurm/diagnosing-problems-with-jobs.html?highlight=job%20status#diagnosing-problems-with-jobs>`_

**Why can’t I use more resources?**

* M3 is operated on shared use model and the MASSIVE team makes a best effort to share resources fairly. If you have special requirements or deadlines contact the `MASSIVE helpdesk <help@massive.org.au>`_ to discuss your needs

**My job is taking a long time to be scheduled - how can I check if there’s a problem?**

* Try `Checking job status <https://docs.massive.org.au/M3/slurm/check-job-status.html#method-1-show-job>`_ and if you still believe there may be a problem contact the `MASSIVE helpdesk <help@massive.org.au>`_

**What is the command to start an interactive session?**

* To start an interactive session, you should use smux. For more information, refer to `Running interactive jobs <https://docs.massive.org.au/M3/slurm/interactive-jobs.html#submitting-an-interactive-job>`_

**How do I run my job? (using slurm, not on the login node)**

* `Running jobs on M3 <http://docs.massive.org.au/M3/slurm/slurm-overview.html#running-jobs-on-m3>`_

========================
M3, desktops and Strudel
========================

**Why can’t I connect to my desktop?**

* Your account may not yet be activated. Once you’ve created your account the MASSIVE team has to associate it with a project in order for it become active. When this occurs the `MASSIVE helpdesk <help@massive.org.au>`_ will send you an email informing you that your access to CVL or M3 is ready along with  instructions on how to set your password
* If you’re using Strudel Desktop, have you installed the required software? See the FAQ “Why is Strudel Desktop not working” below for more information
* If your account has been activated, you’ve set up your password  and you’ve installed all the required software but are still unable to connect to your desktop contact the `MASSIVE helpdesk <help@massive.org.au>`_
* For further information on connecting to your desktop select the link below appropriate to you:
	* CVL users: `Getting started on the CVL@M3 desktop <https://www.cvl.org.au/cvl-desktop/getting-started-with-the-cvl>`_
	* MASSIVE users: `Requesting an account <https://docs.massive.org.au/M3/requesting-an-account.html>`_, `Connecting to M3 <https://docs.massive.org.au/M3/connecting-to-m3.html>`_
	
**What do I do if I forget my password?**

* If you have entered an incorrect password more than five times in a ten minute period the system will block further attempts to log in for another ten minutes. If you’ve forgotten your password you can set it again by logging in to the HPC ID system using your organisational credentials and selecting the Change Linux password button to set your new password

**What do I do if I forget my Strudel Desktop passphrase?**

* You can recreate your passphrase key by deleting the old one, this will prompt you to create a new passphrase when you first log in with your MASSIVE ID. When you start Strudel select Identity from the menu then Delete Key from the drop down (note: to stop having to use the passphrase select Don’t Remember Me; however you will need to use your account password to log in each time you access the system)

**Why is Strudel Web not working?**

* This problem is usually caused by accounts not yet having been activated: refer to the FAQ above “Why can’t I connect to my desktop”
* If you’ve selected the SHOW DESKTOP button on your Strudel Web console but the tab that opens fails to load the desktop, close the tab, return to the console and  select the SHOW DESKTOP button again. If the problem persists contact the `MASSIVE helpdesk <help@massive.org.au>`_

**Why is Strudel Desktop not working?**

* Have you installed the required software? For more information:
	* MASSIVE users should go to: `MASSIVE desktop (Strudel) <https://docs.massive.org.au/M3/connecting/connecting-via-strudel.html#massive-desktop-strudel>`_ using the Strudel Desktop application and select the button that expands the section titled “Instructions for software installation”
	* CVL users: go to `Connecting to a CVL@M3 desktop using the Strudel Desktop application <https://www.monash.edu/cvl/cvl-desktop/getting-started-with-the-cvl/strudel-cvl-desktop-application>`_ and select the button that expands the section titled “Instructions for software installation”
* Has your account been activated? To check this refer to the FAQ above “Why can’t I connect to my desktop”
* For further information on connecting to your desktop select the link below appropriate to you:
	* CVL users: `Getting started on the CVL@M3 desktop <https://www.cvl.org.au/cvl-desktop/getting-started-with-the-cvl>`_
	* MASSIVE users: `Requesting an account <https://docs.massive.org.au/M3/requesting-an-account.html>`_, `Connecting to M3 <https://docs.massive.org.au/M3/connecting-to-m3.html>`_

**I have a slow connection, can I make TurboVNC run faster?**

* Select Options from the TurboVNC menu. On the Encoding tab select Encoding method and then choose one of the “WAN” options. This will reduce the quality of the rendering but increase the interaction speed.

**Is Strudel secure?**

* Strudel uses an SSH (Secure Shell) tunnel to connect users to the MASSIVE visualisation nodes. All traffic between your computer and the node is encrypted in the tunnel

**Can I use Strudel at my HPC or cloud site?**

* Yes, this is easily implemented using a  simple configuration file. Contact the `MASSIVE helpdesk <help@massive.org.au>`_ for more information

**What should I do if I can’t find M3 under the list of the sites on Strudel Desktop?**

* You can add M3 to the list of the sites on Strudel Desktop by opening Strudel, then selecting “Manage sites” on the menu bar. This will allow you to select MASSIVE M3. Select OK to return to the main Strudel Desktop screen. You should be able to now select either “M3 Standard Desktop” or “M3 Large Desktop” under the “Site” section.

**How do I request for software to be installed on HPC?**

* `Requesting an install <https://docs.massive.org.au/M3/software/software.html#requesting-an-install>`_

**How do I request access to restricted software?**

* Log in to `HPC ID <https://hpc.erc.monash.edu.au/karaage/>`_ and select the [Software agreement] button from the left side menu then select the [Add software] button. Select the name of the software to open its Software Details page. To submit your request select the [I accept] button. You will receive an email notification with further information concerning your request within two business days

**Is M3 suitable for running traditional Computational Fluid Dynamics or Molecular Dynamics that require large scaling?**

* Current MASSIVE resources necessitate that you run only one or two large jobs (e.g. CFD, MD) at a time so to MASSIVE service can provide a fair and equitable usage of resources

**How do I run my job? (using slurm, not on the login node)**

* `Running jobs on M3 <http://docs.massive.org.au/M3/slurm/slurm-overview.html#running-jobs-on-m3>`_
