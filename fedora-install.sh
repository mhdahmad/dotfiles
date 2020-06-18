#!/bin/bash

if [ $(id -u) = 0 ]; then
   echo "This script changes your users gsettings and should thus not be run as root!"
   echo "You may need to enter your password multiple times!"
   exit 1
fi


# Some Kernel/Usability Improvements
sudo tee -a /etc/sysctl.d/40-max-user-watches.conf > /dev/null  <<EOF
fs.inotify.max_user_watches=524288
EOF

# Some Kernel/Usability Improvements
sudo tee -a /etc/sysctl.d/99-network.conf > /dev/null  <<EOF
net.ipv4.ip_forward=0
net.ipv4.tcp_ecn=1
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

sudo tee -a /etc/sysctl.d/99-swappiness.conf > /dev/null  <<EOF
vm.swappiness=1
EOF


###
# Optionally clean all dnf temporary files
###

sudo dnf clean all

###
# RpmFusion Free Repo
# This is holding only open source, vetted applications - fedora just cant legally distribute them themselves thanks to 
# Software patents
###

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 

###
# RpmFusion NonFree Repo
# This includes Nvidia Drivers and more
###

sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


###
# Disable the Modular Repos
# Given the added load at updates, and the issues to keep modules updated, in check and listed from the awful cli for it - remove entirely.
###

sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates-modular.repo
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-modular.repo

# Testing Repos should be disabled anyways
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates-testing-modular.repo
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo

# Rpmfusion makes this obsolete
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-cisco-openh264.repo

# Disable Machine Counting for all repos
sudo sed -i 's/countme=1/countme=0/g' /etc/yum.repos.d/*

sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 

printf "[vscodium]\nname=vscodium\nbaseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/vscodium" |sudo tee -a /etc/yum.repos.d/vscodium.repo

###
# Force update the whole system to the latest and greatest
###

sudo dnf upgrade -y

# And also remove any packages without a source backing them
sudo dnf distro-sync -y

sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
