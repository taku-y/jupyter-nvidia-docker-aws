#!/bin/sh

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential linux-image-extra-virtual linux-headers-generic linux-source

cat <<EOF | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off alias lbm-nouveau off
EOF

echo 'options nouveau modeset=0' > /etc/modprobe.d/nouveau-kms.conf

sudo update-initramfs -u

sudo reboot
