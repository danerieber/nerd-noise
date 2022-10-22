#!/bin/bash

source ./devices.sh

if test -f $piano_is_live; then
    for ch in $channels
    do
        pw-link -d "$piano:capture_$ch" "$virtual_mic:input_$ch"
    done
    rm -rf $piano_is_live
    pw-play ./res/piano_live_off.ogg
else
    for ch in $channels
    do
        pw-link "$piano:capture_$ch" "$virtual_mic:input_$ch"
    done
    touch $piano_is_live
    pw-play ./res/piano_live_on.ogg
fi
