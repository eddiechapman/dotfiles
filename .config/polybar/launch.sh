#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch example bar
echo "---" | tee -a /tmp/polybar1.log
polybar example >> /tmp/polybar1.log 2>&1 &

echo "Bar launched.."
