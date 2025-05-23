# Upon following arch linux installation guide https://wiki.archlinux.org/index.php/Installation_guide
# run this after arch-chrooting into /mnt:

sed -i 's/#Color/Color/' /etc/pacman.conf # enable pacman's colored output

pacman -Syu

pacman -S              \
    sudo               \
    htop               \
    man-db             \
    man-pages          \
    dhclient           \
    dhcpcd             \
    wpa_supplicant     \
    iw                 \
    inetutils          \
    net-tools          \
    mlocate            \
    make               \
    wget               \
    openssh            \
    openvpn            \
    nss-mdns           `# local hostname resolution` \
    bind               `# dig utility` \
    gvim               `# gvim to enable clipboard sharing` \
    vim-airline        \
    vim-airline-themes \
    vim-ansible        \
    vim-csound         \
    vim-indent-object  `# select tabulated block of code with ii, ai, aI` \
    vim-molokai        \
    vim-fugitive       \
    vim-nerdtree       \
    vim-tabular        `# Align declarations with :Tab /=` \
    vim-tagbar         `# view tags of a file` \
    vim-ctrlp          \
    vim-ultisnips      \
    vim-easymotion     \
    parcellite         `# clipboard manager` \
    ack                \
    the_silver_searcher`# a faster version of ack. Dependency of vim-fzf`\
    bat                `# syntax hilghlighted cat. Enables syntax highlighting in vim-fzf`\
    rlwrap             `# command history (used in perl repl bash alias)`\
    tree               \
    git                \
    github-cli         \
    nfs-utils          \
    cpanminus          \
    gcc                \
    lazarus-qt6        \
    lua                \
    ntp                \
    docker             \
    postgresql         \
    ntfs-3g            \
    trash-cli          \
    pacman-contrib     `# rankmirrors script and others` \
    asp                `# source code downloader` \
    fd                 \
    fzf

# For booting you might need some of these packages:
pacman -S        \
    grub         \
    refind       `# configure it afterwards according to https://wiki.archlinux.org/index.php/REFInd` \
    efibootmgr

pacman -S               \
    xorg                \
    #gxkb               `# show current xkb layoout in tray` \
    xcolor `#color picker` \
    xfce4               \
    gvfs-mtp            `# enable file transfer from mobile devices` \
    android-utils       `# adb utility (Android Debug Bridge)` \
    file-roller         `# archive manager` \
    rofi                \
    mousepad            \
    unrar               \
    p7zip               \
    atool               \
    newsboat            \
    xfce4-screenshooter \
    xfce4-screensaver   \
    fx                  `# json viewer` \
    prettier            `# json, yaml, js, css, tabulated` \
    ranger              \
    ueberzug            `# enables images in ranger` \
    ffmpegthumbnailer   `# enables video thumbnails in ranger` \
    catdoc              `# enables .rtf and .doc previews in ranger` \
    thunar-archive-plugin   # thunar's context menu for extracting archives

# Benchmarking
pacman -S               \
    stress              \
    kdiskmark           \
    i7z


useradd --create-home mikhail
passwd mikhail
usermod -aG tty mikhail # to be able to run Xorg
echo "mikhail ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

systemctl enable dhcpcd

mkdir /home/mikhail/Pictures # dir to save screenshots with xfce4-screenshooter
chown mikhail:mikhail /home/mikhail/Pictures

cp mimeapps.list /home/mikhail/.config/
# bash xfce-setup.sh # obsolete
mkdir -p /home/mikhail/.config/xfce4/
cp -r xfce4.config/* /home/mikhail/.config/xfce4/
chown -R mikhail:mikhail /home/mikhail/.config

# Disable mouse navigation buttons (maybe better remap?)
cp .Xmodmap ~
chown mikhail:mikhail ~/.Xmodmap

# Disable x suspending (fixes hdmi display not working after sleep)
cp .xinitrc ~

# copy ranger config
cp -r ranger ~/.config/

# copy newsboat config
cp -r .newsboat ~/

# copy zathura config
cp -r zathura ~/.config/

# copy mpv config
cp -r mpv ~/.config/

pacman -S             \
    vlc               \
    mpv               \
    mpv-mpris         `# media keys support` \
    ristretto         \
    webp-pixbuf-loader `# support .webp format` \
    gimp              \
    telegram-desktop  \
    libreoffice-fresh \
    qbittorrent       \
    yt-dlp            \
    xreader djvulibre \
    djview            `# reads .djvu books`\
    foliate           `# reads .mobi books`\
    zathura zathura-pdf-mupdf zathura-ps `# reads .pdf .epub .fb2 books`\
    kchmviewer        \
    rbutil            `# rockbox utility`\
    calc              \
    discount          `# provides "markdown" utility to convert .md to .html` \
    ghostwriter       `# markdown editor` \
    chromium          \
    firefox           \
    vivaldi           \
    playerctl         `# media playback control from console` \
    pulseaudio        \
    conky             \
    calibre           \
    pdfarranger       \
    obs-studio        \
    libva-nvidia-driver `# without it obs doesn't start` \
    shotcut           `# video editor`

# go ot chrome://flags search for "omnibox" and disable all found flags :-)

cp .conkyrc ~
cp autostart/conky.desktop ~/.config/autostart/
cp autostart/stonks-conky.desktop ~/.config/autostart/

sudo systemctl enable avahi-daemon # for local hostname resolution
sudo systemctl enable nfs-server

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
pacman -S                    \
    perl-file-slurp          \
    perl-digest-sha1         \
    perl-xml-libxml          \
    perl-lwp-protocol-https  \
    perl-html-tree           \
    perl-string-util         \
    perl-dbi                 \
    perl-dbd-pg              \
    perl-dbd-sqlite          \
    perl-json-xs             `# faster than perl-json-pp, perl-json-parse and perl-cpanel-json-xs` \
    perl-template-toolkit    \
    perl-term-table          \
    perl-proc-processtable   \
    perl-module-scandeps     `# provides scandeps.pl to search modules dependencies` \
    perl-datetime

# perl modules not available as arch package
cpanm Spreadsheet::XLSX
# make path to mylib with my perl modules
cd /usr/share/perl5/site_perl/
ln -s ~/dev/lib/perl/ mylib

# python packages
pacman -S            \
    python           \
    python-pip       \
    python-numpy     \
    python-pyrss2gen \
    python-psycopg2  \
    python-sqlalchemy\
    python-pandas    \
    python-texttable \
    python-matplotlib

# Create python virtual environment with packages (arch python-* packages aren't available to venv)
# NOTE or better just use system's python (`pip --break-dependencies` mode)
python -m venv $HOME/.venv
$HOME/.venv/bin/pip pyrss2gen  \
                    psycopg2   \
                    pandas     \
                    matplotlib \
                    texttable  \
                    plotly     \
                    sqlalchemy \
                    apimoex

# r packages
pacman -S          \
    r         \
    tk # makes quantmod work
# Also, install quantmod and other r packages

# enable sound
pacman -S alsa-utils
amixer -q sset Master unmute
amixer -q sset Master 40%

# Disable beeping of PC speaker
rmmod pcspkr
echo "blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf


# enhance video
if lspci -v | grep -A1 -e VGA -e 3D | grep -i nvidia
then
    sudo pacman -S nvidia nvidia-settings pkgconf
else
    echo "Your videocard is not nvida. Cna't install drivers for it"
fi
# you possibly need to go to nvidia-settings
# and then to your output (for example, HDMI-0),
# go to Controls tab and set Color Range to Limited
# Then go check your colors on monteon.ru
# Also go to PowerMizer and set Preferred Mode to "Prefer Maximum Performance"

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


# Intel graphics;
sudo pacman -S mesa lib32-mesa # xf86-video-intel vulkan-intel # these two udner question, glamorgl is loaded by Xorg instead, and it works fine


sudo systemctl disable upower # power management daemon. Omit if using notebook
xfce4-power-manager -q # disable unused service
xset -dpms             # disable unused service

#Compositing with nvida doesn't work well. Go to Window Manager Tweaks got to Compositor->Enable Display Compositing uncheck

# NOTE possibly causes lags
# Make xfce actually use cursor theme. https://bugs.launchpad.net/ubuntu/+source/xfwm4/+bug/157447
#pacman -S xcursor-vanilla-dmz `# white cursor theme` \
#echo "[Icon Theme]" > /usr/share/icons/default/index.theme
#echo "Inherits=Vanilla-DMZ" >> /usr/share/icons/default/index.theme
