#!/usr/bin/sh

sudo apt-get -y install make
sudo apt-get -y install curl
sudo apt-get -y install vim-gtk
sudo apt-get -y install git
sudo apt-get -y install tree
sudo apt-get -y install telegram-desktop
sudo apt-get -y install vlc

echo "Installing google-chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable


#echo "Disabling sleep, hibernate and suspend buttons..."
#gsettings set org.gnome.settings-daemon.plugins.power button-suspend "nothing"
#gsettings set org.gnome.settings-daemon.plugins.power button-sleep "nothing"
#gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "nothing"

#echo "Installing skype..."
#dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
#curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
#echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
#sudo apt-get update
#sudo apt-get install skypeforlinux -y


echo "Perl"
sudo apt-get -y install perl-doc

#+-------------------------------------------------------------------+
#  Gsettings stuff
#+-------------------------------------------------------------------+
echo "Setting up gnome-terminal"
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

echo "Disabling update-notifier notifications"
gsettings set com.ubuntu.update-notifier no-show-notifications true
gsettings set com.ubuntu.update-notifier regular-auto-launch-interval 999999
gsettings set com.ubuntu.update-notifier show-apport-crashes false

echo "Disable update-manager prompting about available release upgrades"
sudo sed -i 's/Prompt=.*/Prompt=never/' /etc/update-manager/release-upgrades

echo "Set up gnome-calculator"
gsettings set org.gnome.calculator button-mode keyboard
gsettings set org.gnome.calculator show-thousands true

echo "Set up interface"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface text-scaling-factor 0.8 # this one is arguable
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

# Unset Alt+Tab from application switcher ...
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
# ... and use window switcher instead
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

echo "Setting up nautilus..."
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.list-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.preferences show-hidden-files true
