#!/usr/bin/sh

sudo apt-get -y install make
sudo apt-get -y install curl
sudo apt-get -y install vim-gtk3
sudo apt-get -y install git
sudo apt-get -y install tree
sudo apt-get -y install telegram-desktop
sudo apt-get -y install vlc
sudo apt-get -y install youtube-dl

echo "Installing google-chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable

#echo "Installing skype..."
#dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
#curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
#echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
#sudo apt-get update
#sudo apt-get install skypeforlinux -y


echo "Perl"
sudo apt-get -y install perl-doc
sudo apt-get -y install cpanm
