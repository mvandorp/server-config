#!/bin/bash

# Verify the script is ran as root
if [ "$(whoami)" != "root" ]
then
    echo "This script must be executed as root.";
    exit 0
fi

echo "================================================================================"
echo "=== Enabling i386 packages...                                                ==="
echo "================================================================================"
dpkg --add-architecture i386
apt-get update --assume-yes
apt-get upgrade --assume-yes

echo "================================================================================"
echo "=== Installing 32-bit libraries...                                           ==="
echo "================================================================================"
apt-get install --assume-yes libstdc++6:i386
apt-get install --assume-yes libc6:i386
apt-get install --assume-yes lib32z1-dev
apt-get install --assume-yes lib32z1

echo "================================================================================"
echo "=== Installing additional packages                                           ==="
echo "================================================================================"
apt-get install --assume-yes vim
apt-get install --assume-yes screen
apt-get install --assume-yes rsync
apt-get install --assume-yes git
