.. _misc:

Miscellaneous
*************

**How does Strudel work and is it secure?**

Strudel launches a remote desktop instance by programmatically requesting a visualisation node on the MASSIVE server,
creating an SSH tunnel and launching TurboVNC.

**Can I use Strudel at my HPC or cloud site?**

Yes, this is easily implemented with just a simple configuration file and has been done for a range of sites other
than MASSIVE or the CVL. Instructions to achieve this will be published soon. Until then please feel free to email
us for more information.

**Can I change the size of the Desktop after it has been started?**

You can change the desktop size by entering a value in the "xrandr" command from a terminal on the desktop (e.g. `xrandr -s "1920x1080"`).
If that does not work check the options in TurboVNC (ctl-alt-shift-o), newer versions have a "Remote desktop size"
under "Connection Options", set this to "Server" or the size you would like.

**I have a slow connection can I make TurboVNC perform better?**

From the options menu (ctl-alt-shift-o) you can set the connection speed "Encoding method" to one of the "WAN"
options. This will reduce the quailty of the rendering but increase the interaction speed.

**I have forgotten my passphrase, how do I proceed?**

You can recreate your passphrase key by deleting the old one, this will prompt you to create a new passphrase
when you first login with your MASSIVE id. To delete the key: Indentity > Delete Key, from the Strudel menu.
You can also avoid the key by using Identity > Don't Remember Me.