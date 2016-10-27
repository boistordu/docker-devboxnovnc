#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
startxfce4&
#openbox&
x11vnc -display :1 -nopw -listen localhost -xkb -forever -passwdfile /root/passvnc &
cd /root/noVNC && ln -s vnc_auto.html index.html && ./utils/launch.sh --vnc localhost:5900
