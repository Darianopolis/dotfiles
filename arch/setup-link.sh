# TODO: Backup or prompt on overriding previous files

cd "$(dirname "$0")"

echo "Setting up dotfiles from: $(pwd)"

ln -fs $(pwd)/term/.bashrc ~/.bashrc
ln -fs $(pwd)/term/.blerc ~/.blerc
ln -f  $(pwd)/term/kitty.conf ~/.config/kitty/kitty.conf

ln -fs $(pwd)/../vscode.json $HOME/.config/Code/User/settings.json
