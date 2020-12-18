#!/bin/bash
#
# A Script to Transmit Music to a Bluetooth Speaker
# Created by Stina Storey
#
echo -e "power on" | bluetoothctl
STR=$(hcitool con)
SUB='B8:D5:0B:1F:F2:D2'
echo $STR
while [[ "$STR" != *"$SUB"* ]]; do
	echo -e "connect B8:D5:0B:1F:F2:D2" | bluetoothctl
	STR=$(hcitool con)
done
echo found speaker
sleep 1
aplay -D bluealsa:DEV=B8:D5:0B:1F:F2:D2 /home/pi/Music/Plantasia.wav &
