#!/bin/sh
# a script to setup the proot environment for anki.

export DISPLAY=":1"

# A couple hacks for Qt to work
export QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu"

# Disabling sandbox is a security risk, but we might not have to do this when Anki goes to Qt 6.2
# https://forums.ankiweb.net/t/setting-disable-seccomp-filter-sandbox-by-default-on-linux/13765
export QTWEBENGINE_DISABLE_SANDBOX=1

# Connections are bound to localhost for security, but some interesting configs could be made via ssh port forwarding
tigervncserver -localhost -xstartup /usr/bin/xfce4-session $DISPLAY

/home/anki-user/pyenv/bin/anki

#TODO `am start` to start a vnc-viewer app would be a nice touch

