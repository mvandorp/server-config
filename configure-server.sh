#!/bin/bash

#######################################################################
### EDIT THESE PATHS FOR YOUR OWN SETUP                             ###
#######################################################################

# The left4dead2 directory of your server
L4D2_DIR="$HOME/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/left4dead2/"

#######################################################################
### SHOULD NOT HAVE TO EDIT BELOW HERE                              ###
#######################################################################

main() {
    echo "================================================================================"
    echo "=== Configuring server...                                                    ==="
    echo "================================================================================"

    install "config"
}

install() {
    # Merge the directory into the server's left4dead2 folder
    rsync -av "${1}/" "${L4D2_DIR}"
}

main
