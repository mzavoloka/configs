# DISCLAIMER
This config targets Ubuntu and Debian linux.
The manual is made for user mikhail. If you are setting up linux for another user, you have
to change all the commands and the shell scripts used in the manual accordingly.


### Upgrade freshly installed system

```
sudo apt-get update
sudo apt-get dist-upgrade
```
CAUTION: Try to not run `sudo apt-get upgrade` or `sudo apt-get dist-upgrade` after you have your linux properly configured, because there is a big chance of breaking some parts of the system by upgrading it. Always upgrade your packages one by one so that you always know what can be the cause of problems.


### Install vim package and make vim a default text editor

```
sudo apt-get install vim-gtk
sudo update-alternatives --config editor
```


### Add user to sudoers

```
sudoedit /etc/sudoers
```
Add the following line (to the end!) of /etc/sudoers:
```
mikhail ALL=(ALL:ALL) NOPASSWD:ALL
```


### Install and confugure git

```
sudo apt-get install git
```

scp github ssh key to ~/.ssh folder in order to be able to pull private repos from github
In order to make the key work permanently you may also need to manually specify each key in your ~/.ssh/config like this:
IdentityFile ~/.ssh/mygithubkey

Make vim a difftool:
```
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
```


### Configure vim

Download and place .vim and .vimrc to ~
.vimrc may be modified specifically for different linux distros
No modification required for making Debian files work in Ubuntu

Move everything out of the folder ~/.vim/bundle/ (Vundle will put all plugins there after you install it).
Clone Vundle repo there:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
After that you'll be able to install all other plugins listed in .vimrc running 'PluginInstall' command in vim


### Configure bash shell


Download and place .bashrc to ~
.bashrc may be modified specially for different linux distros

In Ubuntu go to preferences and set there
Color scheme to 'White on black'
Palette to 'Linux console'
Unlimited scrollback
Font to Ubuntu Mono (Regular) of size 11 or 10



### Install tree utility to view folder trees in terminal

```
sudo apt-get install tree
```


### If using Unity desktop environment, you better to change Alt+Tab switching behaviour. Install:

```
sudo apt-get install compizconfig-settings-manager
sudo apt-get install compiz-plugins-extra
```

Disable the keyboard shortcuts for Unity's switcher by unchecking CompizConfig Settings
Manager ▸ Desktop ▸ Ubuntu Unity Plugin ▸ Switcher ▸ Key to start the switcher ▸ Enabled
and Key to start the switcher in reverse ▸ Enabled
And do this for all viewports too

Enable the Static Application Switcher by checking CompizConfig Settings Manager ▸ Window
Management ▸ Static Application Switcher ▸ Enable Static Application Switcher

Then set Bindings in Static Application Switcher settings (to open it, press the button of
it, not the checkbox) for Next Window and Prev Window.

General Options ▸ Desktop Size
Set workspace grid there


### Install google chrome

Для установки Google Chrome сперва нужно загрузить ключ репозитория:
```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```
Добавить, непосредственно, сам репозиторий:
```
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
```

It can either be google-chrome-beta or google-chrome-unstable
```
sudo apt-get install google-chrome-stable
```

### Install and configure samba

```
sudo apt-get install samba
```
And one of those (depends on Ubuntu version):
```
sudo apt-get install smbfs
```
```
sudo apt-get install smbclient
```

Edit samba config file:
```
sudoedit /etc/samba/smb.conf
```
Find these lines:

```
##### Authentication #######

# “security = user” is always a good idea. This will require a Unix account
# in this server for every user accessing the server. See
# /usr/share/doc/samba-doc/htmldocs/Samba-HOWTO-Collection/ServerType.html
# in the samba-doc package for details.
;  security = user
```

Uncomment the security line, and add another line to make it look like this:
```
security = user
username map = /etc/samba/smbusers
```
This will set Samba to use the smbusers file for looking up the user list.

Create a Samba User
```
sudo smbpasswd -a <username>
```

Edit samba users config file
```
sudoedit /etc/samba/smbusers
```
Add this line (this will link linux user with samba user):
```
mikhail = "mikhail"
```

To share root folder add the following to /etc/samba/smb.conf:
```
sudoedit /etc/samba/smb.conf
```

```
[root$]
path = /
create mask = 0755
force user = mikhail
browsable = yes
read only = no
```

This will create folder named root in samba.

And add last changes:
```
sudoedit /etc/samba/smb.conf
```

Add the following lines at the end of the Browsing/Identification section of smb.conf ...
```
netbios name = mynotebook
name resolve order = wins bcast lmhosts host
client lanman auth = yes
client ntlmv2 auth = no
```
Where mynotebook is the name of the computer that will be visible in the explorer

To restart samba, you need to run 2 commands!
```
sudo service smbd restart
sudo service nmbd restart
```


### Download and install some cloud hosting service like Tresorit (no linux support) or Dropbox


*Install Dropbox using only this way!!! If you'll try to install it via package nautilus-dropbox
or via Ubuntu Software Center, you'll stuck!!!*

On other systems:
(there is a linux support).
```
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
```
Next, run the Dropbox daemon from the newly created .dropbox-dist folder:
```
~/.dropbox-dist/dropboxd
```
And create dropbox shortcut for this. Copy some shortcut from /usr/share/applications, change it's name and properties in vim. Even download some Icon for this. And then put back to /usr/share/applications


### Set up gxneur package.

```
sudo apt-get install gxneur
```
Set it up.
```
sudo apt-get install gconf-editor
```
Copy ~/.xneur/xneurrc files from clouds


### If Ubuntu has wireless disabled after booting

To overcome this
```
sudoedit /etc/rc.local
```
And add following line:
```
sudo rfkill unblock wifi
```


### On laptops Ubuntu can always set maximum brightnes level on startup

Set the startup level of brightness:
```
sudoedit /etc/rc.local
```
Put this line to /etc/rc.local (20 is the level of brightness):
```
echo 20 > /sys/class/backlight/intel_backlight/brightness
```
This may not work! (didn't work in Ubuntu 12.04)

If the above doesn't work, you may install the package that saves previous brightness settings:
```
sudo add-apt-repository ppa:nrbrtx/sysvinit-backlight
sudo apt-get update
sudo apt-get install sysvinit-backlight
```


### On laptops Ubuntu can change brightness too dramatically with each step

To make brightness changes smoother:
```
sudo apt-get install xbacklight
```
Now add new shortcuts to this


### Permanently disable Caps Lock

Go to Keyboard Layout, select Options... Caps Lock behaviour -> disabled

In Debian?
```
sudo apt-get install gnome-tweak-tool
```
Run Tweak Tool, select Typing and set Caps Lock key behavior from "Disabled" to "Caps Lock is disabled"


### Russian layout may not work by default

To enable it go to Keyboard Layout. Press on plus sign and select Russian in the list

Go to Keyboard Layout, select Options... Key(s) to change layout. Set it to Alt+Shift


### In gnome-tweak-tool you can set fonts. Just run through the options available there.



### In Settigs go to Appearece and set Wallpapers, Launcher Icons size, auto-hide Launcher



### Disable sleep, hibernate and suspend buttons

```
gsettings set org.gnome.settings-daemon.plugins.power button-suspend "nothing"
gsettings set org.gnome.settings-daemon.plugins.power button-sleep "nothing"
gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "nothing"
```

### Disable sleep on lid closing

In /etc/UPower/UPower.conf set option `Ignored=true`


### Download from cloud startup script and modify it if needed

To make it run on boot:
```
crontab -e
```
Add line
```
@reboot /path/to/script
```


### Make Num Lock enabled by default



### The screen is completely dark while installing Ubuntu?

In such cases just volume brightness up.


### (may be obsolete) Change keybindings for moving between workspaces.

There may be a problem with 4-buttons shortcuts, so install dconf-editor package.
```
sudo apt-get install dconf-editor
```
Run it and go through the path: org.gnome.desktop.wm.keybindings
There are all the shortcuts that can be manually modified

Maybe there is some CLI way. There is a dconf-cli package. Have not tryed it yet.


### Configure Thunderbird

Copy-paste all the existing email accounts from existing OS installation.
```
%APPDATA%\Thunderbird\Profiles\ for windows
and
~/.thunderbird for linux
```
Maybe there is some way to export them from already existing icedove/thunderbird configuration.

For Debian the alternative is icedove
```
sudo apt-get install icedove
```

### (may be obsolete) Set up auto save when taking screenshots. To do this, install scrot:

```
sudo apt-get install scrot
```
If you want to play a sound while screenshoting, install sox package:
```
sudo apt-get install sox
```
Then install this to add mp3 support:
```
sudo apt-get install libsox-fmt-mp3
```
Create folder for scrot files
```
mkdir ~/.scrot
```
Copy the sound for screenshot taking and the script for the shortcut from the dropbox folder to the scrot folder
```
cp -r ~/Dropbox/.scrot/ ~
```
Then bind Print Screen button to the script.
In Ubuntu go to System Settings -> Keyboard -> Shortcuts -> Screenshots. Disable Print Screen. Then go to Custom Screenshots
and create new shortcut. The command should be the following:
```
/home/mikhail/.scrot/shortcut.sh
```


### (may be obsolete) Install adobe flash:

```
sudo apt-get install adobe-flashplugin
```
Or through Ubuntu software center if there is no such package. Search for 'adobe flash'.


### Install all the archivators

```
sudo apt-get install p7zip-full rar lha unrar unzip unace unp
```


### For Ubuntu >14.04 install tweak tool

```
sudo apt-get install unity-tweak-tool
```
Go to Fonts. Set text scale factor.
Go to Switcher. Uncheck show desktop icon.
Go through all the options of this tool.


### If using Ubuntu, uninstall Ubuntu One:

```
sudo apt-get --purge remove .*ubuntuone.* .*couch.*
```


### Change Lenovo notebooks/keyboards default F-keys behaviour

If behaviour of Function keys such that you have to press Fn to access F1-F12 keys, do the following:
In BIOS go to Configuration tab and disable HotKey Mode (or change it to Legacy Mode). Save
and exit. Done. It affects only F keys and doesn't affect, for example, Home, End, Pause,
Break keys, which is what I need.


### Openvpn

```
sudo apt-get install openvpn
```


### On Ubuntu remove trash packages

```
remove totem
remove totem-common
remove rhythmbox
```


### Change scrollbar appearence to normal

In Ubuntu <=12.04
```
gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false
```
In Ubuntu >12.10
```
gsettings set com.canonical.desktop.interface scrollbar-mode normal
```

Change scrollbar color to, for example, navy:
```
sudoedit /usr/share/themes/Ambiance/gtk-3.0/gtk-widgets.css
```
And change there background-image property of classes .scrollbar.button.vertical and .scrollbar.slider.horizontal. For example to #330066:
```
.scrollbar.button.vertical {
  border-width: 1px;
  border-style: solid;
  border-color: shade (@bg_color, 0.86);
  background-image: -gtk-gradient (linear, left top, right top,
                                   from (shade (#330066, 1.08)),
                                   color-stop (0.5, #330066),
                                   to (shade (#330066, 0.94)));
```

In vim you can use the following command for this (just change line numbers accordingly):
```
:1585,1620s/@bg_color/#330066/g
```


### Make Ubuntu dash search only for applications

```
sudo apt-get remove --purge unity-lens-*
```
And delete everything except unity-lens-applications


### Unity3D installation

There is a linux version of Unity3D available since August, 2015!!!
Just download and the .deb file: http://blogs.unity3d.com/2015/08/26/unity-comes-to-linux-experimental-build-now-available/


### Install vlc

sudo apt-get install vlc


### If using Ubuntu 12.04 install MyUnity

```
sudo apt-get install myunity
```
Go through options, you can add workspaces there


### If you're having problems with sound in wine in Ubuntu 12.04

Install package:
```
sudo apt-get install ia32-libs-multiarch
```
And restart pc


### Disable Ubuntu default Alt behavior

Go to Keyboard. And disable "Key To show the HUD"


### Install this thing https://github.com/GGleb/indicator-systemtray-unity

```
sudo apt-add-repository ppa:fixnix/indicator-systemtray-unity
sudo apt-get update
sudo apt-get install indicator-systemtray-unity
```
And relogin, then middle-click on its icon in tray and then scroll middle mouse button while hovering the cursor on top of its icon


### Fix UpWork tracker:

```
wget http://security.ubuntu.com/ubuntu/pool/main/n/nss/libnss3_3.19.2-1ubuntu1_amd64.deb
dpkg -x libnss3_3.19.2-1ubuntu1_amd64.deb .
LD_LIBRARY_PATH=usr/lib/x86_64-linux-gnu/ upwork
nohup upwork &
```
It should start working now
Got it from here: https://community.upwork.com/t5/Freelancers/Error-Message-THERE-WAS-A-PROBLEM-LOADING-UPWORK/td-p/83016/page/15


### Install some software for clipboard management like ClipIt

```
sudo apt-get install clipit
```
In its settings check:
Use Primary (selection)
Synchronize clipboards


### Install gparted

sudo apt-get install gparted


### Install my utilities:

```
mkdir ~/dev/utilities/; cd !$
git clone https://github.com/mzavoloka/gitls
git clone https://github.com/mzavoloka/myfind
git clone https://github.com/mzavoloka/git-cal
```

And configure git-cal by running:
```
cd ~/dev/utilities/git-cal
```
If you have root access:
```
perl Makefile.PL
make
sudo make install
```

If you have no root access:
```
perl Makefile.PL PREFIX=~/.local
make
make install
```


### Install fl studio

Install it through Playonlinux, cause wine 1.6 can't handle fl studio.
Don't forget to go to Settings->Install Components and install Microsoft Core Fonts and tahoma
You may need to make changes in PoL's registry with .reg file for some of the cracks. Use Registry Editor in options for implementing this.


### Install metatrader 4

There's a problem with mt4setup.exe installation with wine (it asks to specify a proxy). I really tried to overcome it, but with no luck.
So the easiest way is to just copy some existing installation of mt4 and run copied terminal.exe with the /portable argument.
If you don't have a copy of an existing installation, than install mt4 on virtualbox and than copy this installation to .wine


### Install perltidy utility

```
sudo apt-get install perltidy
```
and move .perltidyrc config file to your homedir


### Install python package manager

```
sudo apt-get install python-pip
```

### Install python package manager

Got it from here: https://repo.skype.com/

make sure you have 'apt-transport-https' installed
```
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
sudo apt-get update
sudo apt-get install skypeforlinux -y
```

