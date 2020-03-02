#!/usr/bin/env bash
#
# monitors.sh
#
# Connect second monitor if available.
#

xranr | grep 'HDMI-2 connected' &&
    xrandr --output HDMI-2 --auto --right-of eDP-1
