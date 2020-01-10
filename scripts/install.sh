#!/bin/bash

sudo apt update

function install {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

# Basics
install git
install vim
install curl
install htop
install openvpn
install i3

# Dev libraries
install apt-transport-https
install software-properties-common
install build-essentials
install libssl-dev
install libffi-dev

# Python
install python3-pip
install python-dev
install python3-venv

# R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
install r-base
install r-base-dev
