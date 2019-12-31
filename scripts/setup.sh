#!/bin/bash

./symlink.sh
./install.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc
