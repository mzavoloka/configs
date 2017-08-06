#!/usr/bin/sh

# DISCLAIMER: currently only yum package manager is supported
echo "Installing tree utility..."
sudo yum install -y tree

echo "Installing google-chrome..."
sudo cp google-chrome.repo /etc/yum.repos.d/
sudo yum install -y google-chrome-stable

echo "Installing Skype..."
sudo yum-config-manager --add-repo=https://repo.skype.com/data/skype-stable.repo
sudo yum install skypeforlinux -y

echo "Installing EPEL repository..."
sudo yum install -y epel-release

echo "Installing htop..."
sudo yum install -y htop

echo "Installing ntfs-3g..."
sudo yum install -y ntfs-3g

echo "Installing redshift..."
sudo yum install -y redshift

echo "Installing transmission..."
sudo yum install -y transmission

echo "Adding nux repo..."
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

echo "Installing vlc..."
sudo yum install -y vlc
