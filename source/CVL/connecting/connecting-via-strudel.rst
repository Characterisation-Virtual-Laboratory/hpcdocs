.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance.

.. |clustername| replace:: CVL\@MASSIVE

.. _strudel:

***************************************************
Connecting to |clustername| via the MASSIVE desktop
***************************************************

**What is the CVL\@MASSIVE Desktop?**

The CVL\@MASSIVE Desktop is a remote desktop environment that allows researchers to access interactive desktop applications
alongside the MASSIVE HPC environment. We provide two simple utilities to access the MASSIVE Desktop; ``Strudel`` and `Strudel Web <http://desktop.cvl.org.au/>`_.

.. image:: /_static/massive-desktop.png



**The specification of different desktops**

We have three desktop selections available via Strudel and Strudel-Web, they are:

  - Visualisation and Job Submission
      	* 32 available
	* Nvidia K1
	* Intel E5-2680 x 3 Cores
	* 13GB RAM. 

  - Light Compute
	* This is our brand new configuration.
	* 66 available
	* Nvidia P4
	* Intel Xeon Gold 6150 x 6 Cores
	* 55GB RAM
	* CUDA enabled
  
  - Heavy Compute
	* 20 available
	* Nvidia K80
	* Intel E5-2680 x 12 Cores
	* 118GB RAM
	* CUDA enabled

**The Strudel desktop menu**

.. image:: /_static/strudel.png

**Why use the CVL\@MASSIVE Desktop?**

This environment is great for:

    - researchers who are working with increasingly large data sets that cannot be moved to the local desktop for
      analysis and visualisation (for example, researchers working with high resolution volumetric data produced at
      the IMBL at Australian Synchrotron);
    - scientists who are undertaking imaging or visualisation work;
    - researchers who are relatively new to centralised computing infrastructure or HPC and don't yet have a strong
      grasp of the command line environment; and
    - users who need to run interactive visualisation applications on high-end hardware.

**What software is supported on the CVL\@MASSIVE Desktop?**

The list of tools and applications is increasing. Check our :ref:`m3software` page to see a regularly updated list.
If we don't currently support the application you require then we might be able to install it. Please `contact us <help@massive.org.au>`_.

CVL\@MASSIVE Desktop (Strudel)
=========================
**Quick start guide for MASSIVE Desktop**

.. attention::
   Please follow this link: https://www.cvl.org.au/cvl-desktop/getting-started-with-the-cvl and particularly, the instructions under "Connecting to a `CVL\@MASSIVE` desktop"

.. attention::
   The instructions at https://www.massive.org.au/userguide/cluster-instructions/strudel are **now obsolete**.

Frequently Asked Questions
++++++++++++++++++++++++++
.. Please see :ref:`misc`.

**How does Strudel work and is it secure?**

Strudel launches a remote desktop instance by programmatically requesting a visualisation node on the MASSIVE server,
creating an SSH tunnel and launching TurboVNC.

**Can I use Strudel at my HPC or cloud site?**

Yes, this is easily implemented with just a simple configuration file and has been done for a range of sites other
than MASSIVE or the CVL. Instructions to achieve this will be published soon. Until then please feel free to email
us for more information.

**I cannot find M3 under the list of the sites on Strudel Desktop, what should I do??**

You can add M3 to the list of the sites on Strudel Desktop by opening Strudel, then select "Manage sites" on the menu bar. This will allow you to select "MASSIVE M3". Click OK and come back to the main screen of Strudel Desktop. 

Now you should be able to select either "M3 Standard Desktop" or "M3 Large Desktop" under the "Site" section.

**Can I change the size of the Desktop after it has been started?**

You can change the desktop size by entering a value in the ``xrandr`` command from a terminal on the desktop (e.g. ``xrandr -s "1920x1080"``).
If that does not work check the options in TurboVNC (ctl-alt-shift-o), newer versions have a "Remote desktop size"
under "Connection Options", set this to "Server" or the size you would like.

**I have a slow connection can I make TurboVNC perform better?**

From the options menu (ctl-alt-shift-o) you can set the connection speed "Encoding method" to one of the "WAN"
options. This will reduce the quailty of the rendering but increase the interaction speed.

**I have forgotten my passphrase, how do I proceed?**

You can recreate your passphrase key by deleting the old one, this will prompt you to create a new passphrase
when you first login with your MASSIVE id. To delete the key: Indentity > Delete Key, from the Strudel menu.
You can also avoid the key by using Identity > Don't Remember Me.

MASSIVE Desktop in browser (Strudel Web)
========================================
The Strudel Web service offers the same functionality and easy access to MASSIVE as the Strudel desktop client, but does
not require you to install any additional software on your local machine. Log in to the MASSIVE Desktop
via `Strudel Web <http://desktop.cvl.org.au/>`_.

If you have issues connecting to Strudel Web, please try clearing up your browser cookies:

* `Firefox <https://support.mozilla.org/en-US/kb/clear-cookies-and-site-data-firefox>`_
* `Chrome <https://support.google.com/accounts/answer/32050?hl=en>`_
* `Safari <https://support.apple.com/en-au/guide/safari/manage-cookies-and-website-data-sfri11471/mac>`_
