# Origin of this script: https://gist.github.com/elw00d/0826917118d58e81843e2d11bc6cf885

# Bug https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/1683383
# Original article https://habrahabr.ru/post/87408/

# create directory
mkdir xorg-server
cd xorg-server

# get sources of required package
# may be need to uncomment 'deb-src' lines in sources.list before
apt-get source xserver-xorg-core-hwe-16.04

# install dependencies required for building
sudo apt-get build-dep xserver-xorg-core-hwe-16.04

# download patch
wget https://bugs.freedesktop.org/attachment.cgi?id=129861

# apply patch
patch xserver-xorg-core-hwe-16.04_19.3.1/xkb/xkbAction.c < attachment.cgi\?id\=129861

# build
cd xserver-xorg-core-hwe-16.04_19.3.1/
debuild -us -uc
cd ..

# install patched package
sudo dpkg -i ./xserver-xorg-core-hwe-16.04_1.19.3-1ubuntu1-16.04.2_amd64.deb

# pin version of this package to prevent updating later
cat <<EOF>> /etc/apt/preferences.d/xserver-xorg-core-hwe
Package: xserver-xorg-core-hwe-16.04
Pin: version 2:1.19.3-1ubuntu1~16.04.2
Pin-Priority: 700
EOF
# check that pinning works properly
apt-cache policy xserver-xorg-core-hwe-16.04
