#!/bin/bash
new_sink="alsa_output.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.analog-stereo"

pactl set-default-sink $new_sink
pactl list short sink-inputs|while read stream; do
    stream_id=$(echo $stream|cut '-d ' -f1)
    pactl move-sink-input "$stream_id" "$new_sink"
done
