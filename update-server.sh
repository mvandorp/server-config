#!/bin/bash

#######################################################################
### EDIT THESE PATHS FOR YOUR OWN SETUP                             ###
#######################################################################

# The left4dead2 directory of your server
L4D2_DIR="$HOME/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/left4dead2/"

#######################################################################
### SHOULD NOT HAVE TO EDIT BELOW HERE                              ###
#######################################################################

if [ ! -d /home/$USER/steamcmd ]; then
    echo "Unable to find steamcmd, failed to update server."
    exit 0;
fi

cd /home/$USER/steamcmd

echo "================================================================================"
echo "=== Updating Left 4 Dead 2 Dedicated Server...                             ==="
echo "================================================================================"
./steamcmd.sh +login anonymous +force_install_dir $L4D2_DIR +app_update 222860 validate +quit

