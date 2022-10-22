#!/bin/bash

source ./devices.sh

vsid=$(pactl load-module module-remap-sink sink_name=virtual-sink)
echo $vsid > $virtual_sink_id

echo "Creating virtual sink..."


easyeffects --gapplication-service &>/dev/null &

echo "Waiting for easyeffects to start..."
sleep 3

pw-loopback -n 'mic2fx_in' -l 10 &
pw-loopback -n 'piano2headset' -l 3 &
# pw-loopback --capture-props='[media.class=Audio/Sink node.name=virtual-mic]' --playback-props='[media.class=Audio/Source]' -n 'virtual-mic' &
vmid=$(pactl load-module module-remap-source source_name=virtual-mic)
echo $vmid > $virtual_mic_id

echo "Waiting for modules to spawn..."
sleep 1

devices="$mic $piano $virtual_mic mic2fx_in"
for device in $devices
do
    links=$(pw-link -lI | grep -A1 "$device" | grep "|->" | awk '{print $1}')
    for link in $links
    do
        pw-link -d $link
    done
done

echo "Linking channels..."
sleep 1

for ch in $channels
do
    pw-link "$mic:capture_$ch" "mic2fx_in:input_$ch"
    pw-link "mic2fx_in:output_$ch" "$fx_in:playback_$ch"
    
    pw-link "$mic:capture_$ch" "$fx_in:playback_$ch"
    # pw-link "$fx_out:output_$ch" "$virtual_mic:input_$ch"
    pw-link "$virtual_sink_output:output_$ch" "$virtual_mic:input_$ch"
    
    pw-link "$piano:capture_$ch" "piano2headset:input_$ch"
    pw-link "piano2headset:output_$ch" "$headset:playback_$ch"
    
    pw-link "$piano:capture_$ch" "$virtual_mic:input_$ch"
    
    pw-link -d "$fx_out:output_$ch" "$headset:playback_$ch"
    pw-link -d "$mic:capture_$ch" "$fx_in:playback_$ch"
    pw-link -d "virtual-mic:capture_$ch" "piano2headset:input_$ch"
done

touch $piano_is_live

pw-play ./res/startup.ogg