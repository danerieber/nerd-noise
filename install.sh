#!/bin/bash

sudo rm -rf /usr/bin/nerd-noise
sudo cp -r ./src /usr/bin/nerd-noise
sudo sed -i 's+./devices.sh+/usr/bin/nerd-noise/devices.sh+g' /usr/bin/nerd-noise/*.sh
sudo sed -i 's+./res+/usr/bin/nerd-noise/res+g' /usr/bin/nerd-noise/*.sh