#!/bin/bash

INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}')

# Exit if no wireless device found
[ -z "$INTERFACE" ] && echo "No WiFi" && exit

SIGNAL=$(iw dev $INTERFACE link | grep signal | cut -d " " -f 2-)

# Exit cleanly if not connected
[ -z "$SIGNAL" ] && echo "Disconnected" && exit

echo "$SIGNAL"

