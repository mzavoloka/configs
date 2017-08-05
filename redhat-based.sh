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
