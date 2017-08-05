#!/usr/bin/sh

echo "Installing vim..."
sudo apt-get -y install vim-gtk

echo "Installing git..."
sudo apt-get -y install git

echo "Installing tree utility..."
sudo apt-get -y install tree

echo "Disabling sleep, hibernate and suspend buttons..."
sudo gsettings set org.gnome.settings-daemon.plugins.power button-suspend "nothing"
sudo gsettings set org.gnome.settings-daemon.plugins.power button-sleep "nothing"
sudo gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "nothing"

echo "Installing vlc..."
sudo apt-get -y install vlc

echo "Installing skype..."
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
sudo apt-get update
sudo apt-get install skypeforlinux -y

echo "TODO: install google-chrome"
