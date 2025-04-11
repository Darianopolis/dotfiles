#!/bin/bash

yay -Pw             # Check for news and manual intervention
sudo pacman -Syu    # System update
yay -Syu            # AUR update
flatpak upgrade     # Flatpak update
