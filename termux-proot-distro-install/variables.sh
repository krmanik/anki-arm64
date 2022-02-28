#!/bin/sh
# Variables used by install and run scripts

# Bit of a misnomer because it's not a variable, but install and run scripts also need this function
# $1 - logs in as a particular user in the proot (note root is the root user in the proot, not android)
# $@ - command(s) to run as that user
run_command_in_proot (){
    COMMAND_USER="$1"
    shift 1
    # if you run into issues, try removing --isolated
    proot-distro login --isolated --user "$COMMAND_USER" "$DISTRO" -- "$@"
}

# Package(s) needed in vanilla Termux
TERMUX_PACKAGES="proot-distro"

# proot-distro distribution to install. At the time of this writing, every option has a wrong version of libc that anki needs, with the exception of Ubuntu. This could change.
DISTRO="ubuntu"

# User to install anki under in the proot environment. Probably only useful to existing proot-distro users that have $DISTRO installed
ANKI_INSTALL_USER="anki-user"
