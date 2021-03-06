#  Ubuntu Gnome (and partially Unity) setup

#+-------------------------------------------------------------------+
#  Gnome extensions 
#+-------------------------------------------------------------------+
# TODO check if gnome is really in use

# NOTE Ubuntu-specific, I don't like the dock
sudo apt-get -y remove --purge gnome-shell-extension-ubuntu-dock

sudo apt-get -y install gnome-shell-extension-shortcuts
sudo apt-get -y install gnome-shell-extension-impatience
sudo apt-get -y install gnome-shell-extension-hard-disk-led
# NOTE required for Ubuntu clipboards to work properly (see https://wiki.ubuntu.com/ClipboardPersistence )
sudo apt-get -y install gnome-shell-extensions-gpaste

gsettings set org.gnome.shell enabled-extensions "['GPaste@gnome-shell-extensions.gnome.org', 'Shortcuts@kyle.aims.ac.za', 'impatience@gfxmonk.net', 'harddiskled@bijidroid.gmail.com']"


# Different Gnome settings

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


echo "Setting up workspaces..."
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
gsettings set org.gnome.shell.overrides dynamic-workspaces false
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

#echo "Disabling sleep, hibernate and suspend buttons..."
#gsettings set org.gnome.settings-daemon.plugins.power button-suspend "nothing"
#gsettings set org.gnome.settings-daemon.plugins.power button-sleep "nothing"
#gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "nothing"
