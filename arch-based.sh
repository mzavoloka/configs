# Upon following arch linux installation guide https://wiki.archlinux.org/index.php/Installation_guide
# run this after arch-chrooting into /mnt:

pacman -Syu

pacman -S              \
    sudo               \
    htop               \
    man-db             \
    dhclient           \
    dhcpcd             \
    inetutils          \
    net-tools          \
    mlocate            \
    make               \
    wget               \
    openssh            \
    openvpn            \
    gvim               `# gvim to enable clipboard sharing` \
    vim-airline        \
    vim-airline-themes \
    vim-ansible        \
    vim-csound         \
    vim-indent-object  `# select tabulated block of code with ii, ai, aI` \
    vim-molokai        \
    vim-fugitive       \
    vim-tabular        `# Align declarations with :Tab /=` \
    vim-tagbar         `# view tags of a file` \
    vim-ctrlp          \
    vim-ultisnips      \
    parcellite         `# clipboard manager` \
    ack                \
    tree               \
    git                \
    cpanminus          \
    gcc                \
    lua                \
    docker             \
    ntfs-3g            \
    trash-cli          \
    pacman-contrib     `# rankmirrors script and others` \
    fzf

# For booting you might need some of these packages:
pacman -S        \
    grub         \
    refind       `# configure it afterwards according to https://wiki.archlinux.org/index.php/REFInd` \
    efibootmgr

pacman -S               \
    xorg                \
    xfce4               \
    gvfs-mtp            `# enable file transfer from mobile devices` \
    file-roller         `# archive manager` \
    rofi                \
    mousepad            \
    xfce4-screenshooter \
    xfce4-screensaver   \
    thunar-archive-plugin   # thunar's context menu for extracting archives

useradd --create-home mikhail
passwd mikhail
usermod -aG tty mikhail # to be able to run Xorg
echo "mikhail ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

systemctl enable dhcpcd

mkdir /home/mikhail/Pictures # dir to save screenshots with xfce4-screenshooter
chown mikhail:mikhail /home/mikhail/Pictures

# bash xfce-setup.sh # obsolete
mkdir -p /home/mikhail/.config/xfce4/
cp -r xfce4.config/* /home/mikhail/.config/xfce4/
chown -R mikhail:mikhail /home/mikhail/.config

pacman -S             \
    vlc               \
    ristretto         \
    webp-pixbuf-loader `# support .webp format` \
    gimp              \
    telegram-desktop  \
    libreoffice-fresh \
    transmission-gtk  \
    xreader djvulibre \
    fbreader          \
    calc              \
    discount          `# provides "markdown" utility to convert .md to .html` \
    ghostwriter       `# markdown editor` \
    chromium

# Wine and its recommended dependencies:
pacman -S                         \
    wine                          \
    winetricks                    \
    wine-mono                     \
    lib32-mpg123                  \
    lib32-giflib                  \
    lib32-gnutls                  \
    lib32-openal                  \
    lib32-v4l-utils               \
    lib32-libpulse                \
    lib32-libxinerama             \
    opencl-icd-loader             \
    lib32-opencl-icd-loader       \
    lib32-libxslt                 \
    lib32-gst-plugins-base-libs   \
    vkd3d                         \
    lib32-vkd3d                   \
    libgphoto2                    \
    sane                          \
    cups                          \
    samba                         \
    dosbox


# enable port for transmission?
#iptables -I INPUT -p tcp --dport 51413 --syn -j ACCEPT

pacman -S            \
    ttf-dejavu       \
    noto-fonts       `# arabian, georgian, hindi, etc...` \
    noto-fonts-cjk   `# chinese japenese korean` \
    noto-fonts-emoji   # smiles

# perl packages
pacman -S            \
    perl-xml-libxml  \
    perl-datetime

# enable sound
pacman -S alsa-utils
amixer -q sset Master unmute
amixer -q sset Master 40%


# enhance video
if lspci -v | grep -A1 -e VGA -e 3D | grep -i nvidia
then
    sudo pacman -S nvidia nvidia-settings pkgconf
else
    echo "Your videocard is not nvida. Cna't install drivers for it"
fi
# you possibly need to got to nvidia-settings
# and then to your output (for example, HDMI-0),
# go to Controls tab and set Color Range to Limited
# Then go check your colors on monteon.ru

# Only for old nvidia videocards supported by legacy 390xx aur package:
yourcardisold=0
if $yourcardisold
then
    pacman -S linux-headers dkms m4
    mkdir -p /home/mikhail/aur/nvidia-390xx
    cd /home/mikhail/aur/nvidia-390xx

    git clone https://aur.archlinux.org/packages/nvidia-390xx-dkms/
    cd nvidia-390xx-dkms
    makepkg
    pacman -U opencl-nvidia-390xx-390.143-3-x86_64.pkg.tar.zst
    pacman -U nvidia-390xx-utils-390.143-3-x86_64.pkg.tar.zst
    pacman -U nvidia-390xx-dkms-390.143-3-x86_64.pkg.tar.zst

    git clone https://aur.archlinux.org/packages/nvidia-390xx-utils/
    cd nvidia-390xx-utils
    makepkg
    sudo pacman -U libxnvctrl-390xx-390.143-2-x86_64.pkg.tar.zst
    sudo pacman -U nvidia-390xx-settings-390.143-2-x86_64.pkg.tar.zst
    nvidia-xconfig

    # That's a 32 bit version for steam
    git clone https://aur.archlinux.org/lib32-nvidia-390xx-utils.git
    cd lib32-nvidia-390xx-utils
    makepkg
    sudo pacman -U lib32-opencl-nvidia-390xx-390.143-1-x86_64.pkg.tar.zst
    sudo pacman -U lib32-nvidia-390xx-utils-390.143-1-x86_64.pkg.tar.zst
fi

# If your nvidia-settings dous not apply after boot, try running nvidia-settings
# at autostart stage. To achieve this, put .desktop script to user's autostart folder:
mkdir -p ~/.config/autostart/
cp fix-nvidia-colors.desktop ~/.config/autostart/
