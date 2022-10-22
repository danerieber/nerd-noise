#!/bin/bash

mic="alsa_input.usb-Blue_Microphones_Yeti_Nano_2045SG00Y138_888-000154041006-00.analog-stereo"
piano="alsa_input.pci-0000_00_1f.3.analog-stereo"
headset="alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo"
speakers="alsa_output.pci-0000_00_1f.3.analog-stereo"
fx_in="easyeffects_sink"
fx_out="ee_soe_output_level"
virtual_mic="input.virtual-mic"
virtual_sink="virtual-sink"
virtual_sink_output="output.virtual-sink"

channels="FL FR"

piano_is_live="/tmp/nerd-noise-piano-live"
virtual_mic_id="/tmp/nerd-noise-virtual-mic-id"
virtual_sink_id="/tmp/nerd-noise-virtual-sink-id"