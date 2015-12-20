#!/bin/bash

#######################################################################
### EDIT THESE PATHS FOR YOUR OWN SETUP                             ###
#######################################################################

# The left4dead2 directory of your server
L4D2_DIR="$HOME/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/left4dead2/"

#######################################################################
### SHOULD NOT HAVE TO EDIT BELOW HERE                              ###
#######################################################################

echo "================================================================================"
echo "=== Downloading server plugins...                                            ==="
echo "================================================================================"
cd /home/$USER
if [ ! -d server-addons ]; then
	git clone https://github.com/mvandorp/server-addons.git
fi
cd /home/$USER/server-addons
git fetch --all
git reset --hard origin/master
chmod +x install-plugins.sh
./install-plugins.sh

echo "================================================================================"
echo "=== Downloading server config...                                             ==="
echo "================================================================================"
cd /home/$USER
if [ ! -d server-config ]; then
	git clone https://github.com/mvandorp/server-config.git
fi
cd /home/$USER/server-config
git fetch --all
git reset --hard origin/master
chmod +x configure-server.sh
./configure-server.sh

echo "================================================================================"
echo "=== Restoring databases.cfg...                                               ==="
echo "================================================================================"
cd /home/$USER
if [ -f databases.cfg ]; then
	cp databases.cfg "${L4D2_DIR}/addons/sourcemod/configs/databases.cfg"
fi
