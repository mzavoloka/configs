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
cp -r .vim* $HOME
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qa # runs :PluginInstall from the shell

echo "Making current user a sudoer with no password..."
# NOTE you can't just do `echo >> /etc/sudoers`
echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

echo "Making vim a difftool..."
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3

echo "Setting git push.default option to simple..."
git config --global push.default simple

echo "Disabling Caps Lock..."
sudo setxkbmap -option ctrl:nocaps

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
