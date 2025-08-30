#!/bin/bash

# TODO: Backup or prompt on overriding previous files

cd "$(dirname "$0")"

echo "Setting up dotfiles from: $(pwd)"

cp $(pwd)/terminal/.bashrc ~/.bashrc
# cp $(pwd)/terminal/kitty.conf ~/.config/kitty/kitty.conf

# cp $(pwd)/../vscode/settings.json $HOME/.config/Code/User/settings.json

sudo cp $(pwd)/update.sh /usr/local/bin/update
sudo chmod +x /usr/local/bin/update
