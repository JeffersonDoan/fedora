#!/usr/bin/bash

cd ~

# Retrieve data for the setup script
wget https://raw.githubusercontent.com/JeffersonDoan/fedora-setup/master/bashrc.aliases
wget https://raw.githubusercontent.com/JeffersonDoan/fedora-setup/master/fedora.flatpak
# wget https://raw.githubusercontent.com/JeffersonDoan/fedora-setup/master/fedora.packages

# Install Fedora Workstation repository
## sudo dnf install fedora-workstation-repositories -y

# Install RPMFusion repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update cache for package installs
sudo dnf makecache

# Install TeamViewer
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y

# Install Joplin
wget https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh && sudo chmod +x Joplin_install_and_update.sh && ./Joplin_install_and_update.sh

# Install packages from fedora.packages
# sudo dnf install $(cat ~/fedora.packages) -y

# Install Flatpaks from fedora.flatpak
flatpak install flathub $(cat ~/fedora.flatpak) -y

# Custom shell prompt with aliases - source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
cat ~/bashrc.aliases >> ~/.bashrc

# Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf

# Install NVIDIA driver
sudo dnf install xorg-x11-drv-nvidia akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y
sudo dnf update -y
