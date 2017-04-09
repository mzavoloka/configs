### Virtualizing existing Ubuntu installation if you have it in dualboot

Actually you can find all the info here: https://www.virtualbox.org/manual/ch09.html#rawdisk
You have to have properly configured grub (i.e. you have to be able to actually dualboot to Ubuntu from grub)

Create vmdk file that will be used by VBs VM by running this in cmd:
```
C:\Program...\VirtualBox\VBoxManage.exe internalcommands createrawvmdk -filename C:\Program...\VirtualBox\rawubuntu.vmdk -rawdisk \\.\PhysicalDrive0 -partitions 2
```
-rawdisk \\.\PhysicalDrive0 is like /dev/sda in linux. 1 would be /dev/sdb and so on
-partitions 2 means that it will be the 2nd partition (on which Ubuntu is installed).
Detect where Ubuntu resides in 'Disk Management'

Then specify newly created .vmdk file in VBs Ubuntu VM in Settings (of VM) ▸ Storage ▸ And add SATA Controller there
Now run the VM!

Install Guest Additions. Power off, then start again.

If you have problems with Unity, run the following:
```
sudo apt-get update
sudo apt-get install unity
```
Power off, start again. If Unity's settings are corrupted, use linux-setup to fix it. Search for 'compiz'.

Share folders between VM and Windows. Create a folder in windows like C:\ubuntu.
In VB options add Windows C:\ubuntu to Shared Folders ▸ Machine Folders. Check 'Auto Mount' and 'Make Permanent'.
Create some folder like ~/windows inside Ubuntu.
Then run:
```
sudo mount -t vboxsf ubuntu /home/mikhail/windows
```

### In Win 7 or 2008 R2 disable Caps Lock by creating running disable-caps-lock.reg file (in this repo)


### Install essential programs:
http://www.7-zip.org/
http://www.videolan.org/vlc/index.html
http://clipdiary.com/
http://www.stdutility.com/stduviewer.html


### Install Punto Switcher
https://yandex.ru/soft/punto/


### If using bloody mouse, disable the mouse wheel appearing on the right side of chrome glitch:

Right-click on the system icon and go to 4-way mouse scrolling and set it to "normal wheel".

Got it here: https://productforums.google.com/forum/#!msg/chrome/RpBmvrQZa1Q/2q82ma30JysJ


### On Windows server install Xinput and XAudio Dll’s

Got it from here: http://www.win2012workstation.com/xinput-and-xaudio-dlls/

For various games and applications from the Windows Store or other sources, pharmacy you will need to have Xinput1_4.dll, buy XInput9_1_0.dll and XAudio2_8.dll installed in order to work. If these files are not installed, stuff the applications will crash or just disappear when running them. The files from this package are extracted from a fresh installation of Windows 8 RTM.

1. Download X_Audio_Input.zip (313 KB) from win2012workstation ( http://www.win2012workstation.com/wp-content/uploads/2012/08/X_Audio_Input.zip ).

2. After downloading the zip extract the zip, run install.cmd as an Administrator and follow the instructions on the screen.


### Configure Steam

Steam Overlay shows up as big picture mode at all times?
https://www.reddit.com/r/Steam/comments/459e8v/steam_overlay_shows_up_as_big_picture_mode_at_all/
It's an option in the new beta client, Steam > Settings > In-Game
It's so you can use the Steam Controller without having to use Big Picture Mode, it will just used the BPM overlay instead of the desktop overlay.

### Install Git
https://git-for-windows.github.io/
Add this path to $PATH env var (in order to have access to mingw binaries from cmd):
```
C:\Program Files\Git\mingw64\bin
```
Configure its MinGW. Put .vimrc and .vim/ to c:\Users\Mikhail\
Then install Vundle repo:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Run vim and run :PluginInstall

Install python and set env var for its binary:
```
C:\Python27
```
