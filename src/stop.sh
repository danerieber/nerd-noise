#!/bin/bash

source ./devices.sh

killall pw-loopback
killall easyeffects

pactl unload-module $(cat $virtual_mic_id)
pactl unload-module $(cat $virtual_sink_id)

pw-play ./res/shutdown.ogg

rm $piano_is_live
rm $virtual_mic_id
rm $virtual_sink_id