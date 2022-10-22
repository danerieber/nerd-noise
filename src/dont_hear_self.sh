#!/bin/bash

source ./devices.sh

for ch in $channels
do
    pw-link -d "$virtual_sink_output:output_$ch" "$headset:playback_$ch"
    pw-link -d "$virtual_sink_output:output_$ch" "$speakers:playback_$ch"
done

pw-play ./res/dont_hear_self.ogg