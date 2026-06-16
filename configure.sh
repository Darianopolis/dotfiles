#!/bin/bash

cd "$(dirname "$0")"
echo "Setting up dotfiles from: $(pwd)"

# .bashrc

cp terminal/.bashrc ~/.bashrc

# VS Code

mkdir -p ~/.config/Code/User
cp vscode/settings.json ~/.config/Code/User/settings.json

# Update Script

cp update.sh ~/.local/bin/update
chmod +x ~/.local/bin/update
