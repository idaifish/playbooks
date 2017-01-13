#!/usr/bin/env bash

#------------------------------------------
# Configuring Kernel Debugging Environment.
# For Ubuntu 14.04
#------------------------------------------

echo "[*] Installing kdump, crash, kexec-tools"
sudo apt-get install linux-crashdump
echo "OK."

echo "[*] Enable the kdump."
sed -i "s/USE_KDUMP=0/USE_KDUMP=1/" /etc/default/kdump-tools
echo "OK."

echo "[*] Adding Kernel debugging symbol."
codename=$(lsb_release -c | awk '{print $2}')
sudo cat >>/etc/apt/sources.list <<EOF
deb http://ddebs.ubuntu.com/ trusty main restricted universe multiverse
deb http://ddebs.ubuntu.com/ trusty-security main restricted universe multiverse
deb http://ddebs.ubuntu.com/ trusty-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com/ trusty-proposed main restricted universe multiverse
EOF

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ECDCAD72428D7C01
sudo apt-get update
sudo apt-get install linux-image-$(uname -r)-dbgsym
echo "OK"

echo "[*] Starting Kdump-tools service."
sudo /etc/init.d/kdump-tools/ start
sudo /etc/init.d/kdump-tools/ status
echo "OK."

echo "Configured successfully."
echo "Usage: crash /usr/lib/debug/boot/vmlinux-$(uname -r)-generic kernel-dump"
