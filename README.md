# fedora-setup
Setup script for Fedora

Enter the following command in the terminal to run the script:

`wget https://raw.githubusercontent.com/JeffersonDoan/fedora-setup/master/fedora-setup.sh && sudo chmod +x fedora-setup.sh && ./fedora-setup.sh`

This script will:
1. Install repositories (RPMFusion, Flathub)
2. Install Teamviewer via RPM package
3. Install Joplin via shell script
4. Install packages via DNF (including NVIDIA driver)
5. Install Flatpaks
6. Disable Wayland and use Xorg for Graphics
7. Update the rest of the system packages
