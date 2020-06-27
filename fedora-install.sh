#!/bin/bash

if [ $(id -u) = 0 ]; then
   echo "This script changes your users gsettings and should thus not be run as root!"
   echo "You may need to enter your password multiple times!"
   exit 1
fi

while test $# -gt 0
do
  case "$1" in
    --flatpak)
        echo "flatpak packages will be installed"
        FLATPAK=true
      ;;
  esac
  shift
done

# Clean all dnf temporary files
# sudo dnf clean all

cat << EOF

###############################
#      Install Repositories   #
###############################

EOF

# RpmFusion Free Repo
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# RpmFusion NonFree Repo
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Disable the Modular Repos
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates-modular.repo
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-modular.repo

# Rpmfusion makes this obsolete
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-cisco-openh264.repo

# Disable Machine Counting for all repos
sudo sed -i 's/countme=1/countme=0/g' /etc/yum.repos.d/*

# VSCode Repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio
Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc"
> /etc/yum.repos.d/vscode.repo'

# Flathub Repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

cat << EOF

###############################
#      Upgrade Packages       #
###############################

EOF

# Upgrade system packages
sudo dnf upgrade -y
sudo dnf distro-sync -y

cat << EOF

###############################
#      Install Codecs         #
###############################

EOF

# Install RPMFusion codecs
sudo dnf groupupdate core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

cat << EOF

###############################
#    Install Packages         #
###############################

EOF

# Install needed packages
sudo dnf install -y \
acpi `# Show battery status` \
aria2 `# Ultra fast download utility` \
bat `# A cat clone with syntax highlighting` \
breeze-cursor-theme \
celluloid \
chromium-freeworld \
code \
dconf-editor \
exfat-utils \
ffmpeg `# ffmpeg video convertor` \
ffmpeg-libs \
fira-code-fonts `# Fira Code font` \
foliate `# E-book viewer` \
fuse-exfat \
fuse-sshfs \
gitg \
glances \
gnome-shell-extension-appindicator \
gnome-shell-extension-dash-to-dock \
gnome-shell-extension-gpaste \
gnome-shell-extension-pomodoro \
htop \
iotop \
keepassxc `# Password Manager` \
libreoffice-langpack-ar \
libva-intel-driver \
libva-intel-hybrid-driver \
lm_sensors \
lsd \
'mozilla-fira-*' \
mpv \
neofetch \
neovim \
nethogs `# Net top tools` \
nodejs \
p7zip \
p7zip-plugins \
papirus-icon-theme \
peek \
podman-docker \
powertop \
pulseeffects \
python3-devel \
python3-neovim \
ripgrep \
setroubleshoot \
starship \
telegram-desktop \
tilix \
tilix-nautilus \
toolbox \
transmission \
tuned \
tuned-utils \
tuned-profiles-compat \
uget \
unar \
yarnpkg \
youtube-dl \
zsh \
zsh-autosuggestions \
zsh-syntax-highlighting

# Install Flatpak packages
if [ ! -z "$FLATPAK" ]; then
  flatpak install flathub \
  com.discordapp.Discord \
  com.getpostman.Postman \
  com.slack.Slack \
  org.gtk.Gtk3theme.Adwaita-dark
fi

# The user needs to reboot to apply all changes.
cat << EOF

###############################
#        Please Reboot        #
###############################

EOF
exit 0
