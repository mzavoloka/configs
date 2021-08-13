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
elif [ -f /etc/arch-release ]; then
  OS=arch
  sh arch-based.sh
elif [ -f /etc/debian_version ]; then
  OS=`cat /etc/debian_version`
  sh debian-based.sh
else
  echo "The distro you're using is not supported by this script. Exiting"
  echo "(TIP: But you always can modify the script yourself to support the distro)"
  exit
fi
echo "OS version detected: $OS"


echo "Copying .dircolors to homedir..."
cp .dircolors $HOME

echo "Copying .bashrc to homedir..."
cp .bashrc $HOME

echo "Setting up vim..."
cp -r .vimrc $HOME
#cp -r .vim* $HOME # NOTE revise .vim dir, some files from there are still viable
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qa # runs :PluginInstall from the shell

#echo "Making current user a sudoer with no password..."
# NOTE you can't just do `echo >> /etc/sudoers`
#echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

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
git config --global pull.rebase false # merge (the default strategy)

echo "Setxkbmap on xorg startup..."
sudo echo 'Section "InputClass"
  Identifier "system-keyboard"
  MatchIsKeyboard "on"
  Option "XkbLayout" "us,ru"
  Option "XkbOptions" "caps:escape,grp:sclk_toggle,grp:toggle,grp_led:scroll"
EndSection' > /etc/X11/xorg.conf.d/00-keyboard.conf

echo "Installing my utilites..."
mkdir $HOME/dev/
mkdir $HOME/dev/utilities/; cd $HOME/dev/utilities
git clone git@github.com:mzavoloka/gitls
git clone git@github.com:mzavoloka/myfind
git clone git@github.com:mzavoloka/todo
git clone git@github.com:mzavoloka/git-cal
cd git-cal/
perl Makefile.PL
make
sudo make install
cd $PWD

echo "DONE. Sourcing .bashrc and quitting"
source ~/.bashrc
