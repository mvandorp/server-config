#!/bin/bash

USER=steam
PASSWORD=password

# Verify the script is ran as root
if [ "$(whoami)" != "root" ]
then
    echo "This script must be executed as root.";
    exit 0
fi

echo "================================================================================"
echo "=== Downloading additional scripts...                                        ==="
echo "================================================================================"
wget -N -q https://raw.githubusercontent.com/mvandorp/server-config/master/install-packages.sh
chmod +x install-packages.sh

echo "================================================================================"
echo "=== Installing packages...                                                   ==="
echo "================================================================================"
./install-packages.sh

# Create user if it doesn't exist
if ! getent passwd $USER > /dev/null 2>&1; then
    echo "================================================================================"
    echo "=== Creating user...                                                         ==="
    echo "================================================================================"
    useradd -m -U $USER
    echo "$USER:$PASSWORD" | chpasswd
fi

# Switch to user
sudo -u $USER bash << EOF
    if [ ! -d /home/$USER/steamcmd ]; then
        mkdir -p /home/$USER/steamcmd
    fi

    cd /home/$USER/steamcmd

    if [ ! -s steamcmd.sh ]; then
        echo "================================================================================"
        echo "=== Installing SteamCMD...                                                   ==="
        echo "================================================================================"
        wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
        tar -xvzf steamcmd_linux.tar.gz
        rm steamcmd_linux.tar.gz
    fi

    echo "================================================================================"
    echo "=== Installing Left 4 Dead 2 Dedicated Server...                             ==="
    echo "================================================================================"
    ./steamcmd.sh +login anonymous +force_install_dir "/home/$USER/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server" +app_update 222860 validate +quit

    echo "================================================================================"
    echo "=== Downloading server plugins...                                            ==="
    echo "================================================================================"
    cd /home/$USER
    git clone https://github.com/mvandorp/server-addons.git
    cd /home/$USER/server-addons
    git fetch --all
    git reset --hard origin/master
    chmod +x install-plugins.sh
    ./install-plugins.sh

    echo "================================================================================"
    echo "=== Downloading server config...                                             ==="
    echo "================================================================================"
    cd /home/$USER
    git clone https://github.com/mvandorp/server-config.git
    cd /home/$USER/server-config
    git fetch --all
    git reset --hard origin/master
    chmod +x configure-server.sh
    ./configure-server.sh
EOF
