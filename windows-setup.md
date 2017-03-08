-------------------------------------------------------------------
# Virtualizing existing Ubuntu installation if you have it in dualboot
# Actually you can find all the info here: https://www.virtualbox.org/manual/ch09.html#rawdisk
# You have to have properly configured grub (i.e. you have to be able to actually dualboot to Ubuntu from grub)

# Create vmdk file that will be used by VBs VM by running this in cmd:
C:\Program...\VirtualBox\VBoxManage.exe internalcommands createrawvmdk -filename C:\Program...\VirtualBox\rawubuntu.vmdk -rawdisk \\.\PhysicalDrive0 -partitions 2
# -rawdisk \\.\PhysicalDrive0 is like /dev/sda in linux. 1 would be /dev/sdb and so on
# -partitions 2 means that it will be the 2nd partition (on which Ubuntu is installed).
# Detect where Ubuntu resides in 'Disk Management'

# Then specify newly created .vmdk file in VBs Ubuntu VM in Settings (of VM) ▸ Storage ▸ And add SATA Controller there
# Now run the VM!

# Install Guest Additions. Power off, then start again.

# If you have problems with Unity, run the following:
update
install unity
# Power off, start again. If Unity's settings are corrupted, use linux-setup to fix it. Search for 'compiz'.

# Share folders between VM and Windows. Create a folder in windows like C:\ubuntu.
# In VB options add Windows C:\ubuntu to Shared Folders ▸ Machine Folders. Check 'Auto Mount' and 'Make Permanent'.
# Create some folder like ~/windows inside Ubuntu.
# Then run:
sudo mount -t vboxsf ubuntu /home/mikhail/windows


-------------------------------------------------------------------
# In Win 7 or 2008 R2 disable Caps Lock by creating running disable-caps-lock.reg file (in this repo)


-------------------------------------------------------------------
# If using bloody mouse, disable the mouse wheel appearing on the right side of chrome glitch:
# Right-click on the system icon and go to 4-way mouse scrolling and set it to "normal wheel".

# Got it here: https://productforums.google.com/forum/#!msg/chrome/RpBmvrQZa1Q/2q82ma30JysJ
