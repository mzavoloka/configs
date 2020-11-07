#!/usr/bin/sh

#echo "Checking if running with sudo privileges..."
#if [ "$EUID" -ne 0 ]
#  then echo "This script has to be runned with sudo privileges"
#  exit
#fi

echo "Detecting distribution name..."
if [ -f /etc/redhat-release ]; then
  OS=`cat /etc/redhat-release`
  sh redhat-based.sh
elif [ -f /etc/debian_version ]; then
  OS=`cat /etc/debian_version`
  sh debian-based.sh
else
  echo "The distro you're using is not supported by this script. Exiting"
  echo "(TIP: But you always can modify the script yourself to support the distro)"
  exit
fi
echo "OS version detected: $OS"


echo "Copying .bashrc to homedir..."
cp .bashrc $HOME

echo "Setting up vim..."
cp -r .vimrc $HOME
#cp -r .vim* $HOME # NOTE revise .vim dir, some files from there are still viable
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qa # runs :PluginInstall from the shell

echo "Making current user a sudoer with no password..."
# NOTE you can't just do `echo >> /etc/sudoers`
echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

git config --global alias.co checkout

echo "Making vim a difftool..."
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3

echo "Setting git push.default option to simple..."
git config --global push.default simple

echo "Setting git name and email"
git config --global user.name "Mikhail Zavoloka"
git config --global user.email "mikhail.zavoloka@gmail.com"

echo "Avoiding 'git pull' warning:
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:"
git config pull.rebase false # merge (the default strategy)

echo "Setxkbmap on wm startup..."
mkdir -p ~/.config/autostart/
echo '[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Script
Type=Application
Exec=setxkbmap -layout us,ru -option caps:escape,grp:alt_shift_toggle
Icon=
Terminal=false
StartupNotify=false
Hidden=false
GenericName=
GenericName[en_US]=
sudo setxkbmap -option ctrl:nocaps' > ~/.config/autostart/setxkbmap.desktop

echo "Installing my utilites..."
mkdir $HOME/dev/
mkdir $HOME/dev/utilities/; cd $HOME/dev/utilities
git clone https://github.com/mzavoloka/gitls
git clone https://github.com/mzavoloka/myfind
git clone https://github.com/mzavoloka/git-cal
cd git-cal/
perl Makefile.PL
make
sudo make install
cd $PWD

echo "DONE. Sourcing .bashrc and quitting"
source ~/.bashrc
