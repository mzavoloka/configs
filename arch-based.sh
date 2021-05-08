# Upon following arch linux installation guide https://wiki.archlinux.org/index.php/Installation_guide
# run this after arch-chrooting into /mnt:
pacman -S        \
    sudo         \
    htop         \
    man-db       \
    dhclient     \
    dhcpcd       \
    inetutils    \
    net-tools    \
    mlocate      \
    make         \
    wget         \
    openssh      \ # enables ssh
    gvim         \ # gvim to enable clipboard sharing
    parcellite   \ # clipboard manager
    ack          \
    tree         \
    git          \
    cpanminus    \
    ntfs-3g      \
    trash-cli

# For booting you might need some of these packages:
pacman -S        \
    grub         \
    refind       \ # configure it afterwards according to https://wiki.archlinux.org/index.php/REFInd
    efibootmgr

pacman -S        \
    xorg         \
    xfce4        \
    gvfs-mtp     \ # enable file transfer from mobile devices
    file-roller           \ # archive manager
    xfce4-screenshooter   \
    thunar-archive-plugin   # thunar's context menu for extracting archives

useradd --create-home mikhail
passwd mikhail
usermod -aG tty mikhail # to be able to run Xorg
# NOTE see install.sh script, it makes your user a sudoer

systemctl enable dhcpcd

mkdir /home/mikhail/Pictures # dir to save screenshots with xfce4-screenshooter
chown mikhail:mikhail /home/mikhail/Pictures

cp -r xfce4.config/* /home/mikhail/.config/xfce4/

pacman -S        \
    vlc          \
    chromium

bash xfce-setup.sh
