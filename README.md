# nerd-noise

Some custom Bash scripts I wrote to take advantage of the PipeWire and PulseAudio CLI tools to automate certain tasks for my audio setup.

# Features

- Load default setup with `default.sh`: Adds all necessary loopbacks, sinks, and sources; adds/removes links as needed.
- Shutdown setup with `stop.sh`: Removes all loopbacks and PulseAudio modules
- Toggle live piano with `toggle_piano_is_live.sh`: Toggles whether piano input is routed through microphone. Plays a sound to indicate on/off.
- Dont hear microphone output with `dont_hear_self.sh`: Unlinks microphone output from headest/speakers
- Includes noises to indicate completion of scripts (useful for using keyboard shortcuts)

# Install

`install.sh` will copy all files to `/usr/bin/nerd-noise` and replace paths in scripts as needed

# KDE Custom Shortcuts

My configuration is as follows:

| Keybind                          | Script                                        |
| -------------------------------- | --------------------------------------------- |
| <kbd>Meta</kbd> + <kbd>F9</kbd>  | `/usr/bin/nerd-noise/default.sh`              |
| <kbd>Meta</kbd> + <kbd>F10</kbd> | `/usr/bin/nerd-noise/stop.sh`                 |
| <kbd>Meta</kbd> + <kbd>F11</kbd> | `/usr/bin/nerd-noise/toggle_piano_is_live.sh` |
| <kbd>Meta</kbd> + <kbd>F12</kbd> | `/usr/bin/nerd-noise/dont_hear_self.sh`       |