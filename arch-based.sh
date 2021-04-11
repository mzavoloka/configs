# Upon following arch linux installation guide https://wiki.archlinux.org/index.php/Installation_guide
# run this after arch-chrooting into /mnt:
pacman -S        \
    man-db       \
    dhclient     \
    inetutils    \
    net-tools    \
    grub         \
    refind       \ # configure it afterwars according to https://wiki.archlinux.org/index.php/REFInd
    efibootmgr   \
    mlocate      \
    dhcp         \ # probably, not needed
    wget         \
    openssh      \ # enables ssh
    gvim         \ # gvim to enable clipboard sharing
    parcellite   \ # clipboard manager
    ack          \
    git          \
    trash-cli    \
    gvfs-mtp     \ # enable file transfer from mobile devices
    file-roller           \ # archive manager
    thunar-archive-plugin   # thunar's context menu for extracting archives
