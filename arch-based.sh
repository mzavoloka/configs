# Upon following arch linux installation guide https://wiki.archlinux.org/index.php/Installation_guide
# run this after arch-chrooting into /mnt:
pacman -S        \
    sudo         \
    htop         \
    man-db       \
    dhclient     \
    inetutils    \
    net-tools    \
    mlocate      \
    make         \
    dhcp         \ # probably, not needed
    wget         \
    openssh      \ # enables ssh
    gvim         \ # gvim to enable clipboard sharing
    parcellite   \ # clipboard manager
    ack          \
    git          \
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
    thunar-archive-plugin   # thunar's context menu for extracting archives

useradd --create-home mikhail
passwd mikhail
usermod -aG tty mikhail # to be able to run Xorg
# NOTE see install.sh script, it makes your user a sudoer

pacman -S        \
    vlc          \
    chromium

bash xfce-setup.sh
