#!/usr/bin/env bash
# vncserv script

authfile="$(ps ax | grep auth | awk '/gdm3/ { print $13 }')"
/usr/bin/x11vnc -auth $authfile -localhost -display :0

exit 0 
