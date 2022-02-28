#!/bin/sh
# Commands needed to run once to install Anki in a proot-distro OS. Keeps the run script faster

# Variables file used to configure behavior of the install and run scripts
. ./variables.sh

# fyi Termux's pacakge manager "pkg" is a wrapper around apt.
# apt does have an option to automatically upgrade packages (--assume-yes) but I don't think this should be used.
pkg upgrade
pkg install "$TERMUX_PACKAGES"
proot-distro install "$DISTRO"
# From this point on we run code in the proot environment and not Termux itself 

# Qt (and thus Anki) doesn't like running as an user named root, even if it is a fake root like proot.
run_command_in_proot root adduser --disabled-password --gecos "" "$ANKI_INSTALL_USER"

# Anki requires an X server at minumum and a somewhat intuitive window manager to be useable. My preference for the X server is tigervnc and to connect to it with a VNC client for Android. For the window manager, xfwm4 fron Xfce will do. Customization/use of lighter-weight software can be done here.
X_PACKAGES="tigervnc-standalone-server xfce4"

# Anki dependencies
run_command_in_proot root apt install python3-pyqt5.qtwebengine python3-pyqt5.qtmultimedia $X_PACKAGES

# Get the latest Anki stable release via pip - https://betas.ankiweb.net/#via-pypipip
run_command_in_proot "$ANKI_INSTALL_USER" python3.9 -m venv --system-site-packages pyenv

# The following is recommended by  the instructions above, but seems to be broken due to: https://github.com/pypa/pip/issues/10887
#run_command_in_proot "$ANKI_INSTALL_USER" pyenv/bin/pip install --upgrade pip

# note adding --pre flag after pip install will get the latest beta. without it, get the latest stable 
run_command_in_proot "$ANKI_INSTALL_USER" pyenv/bin/pip install --upgrade aqt

#TODO copy run.sh to the user's PATH
#TODO handle existing users upgrading their anki using pip
