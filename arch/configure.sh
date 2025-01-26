# TODO: Backup or prompt on overriding previous files

cd "$(dirname "$0")"

echo "Setting up dotfiles from: $(pwd)"

ln -fs $(pwd)/terminal/.bashrc ~/.bashrc
ln -f  $(pwd)/terminal/kitty.conf ~/.config/kitty/kitty.conf

ln -fs $(pwd)/../vscode/settings.json $HOME/.config/Code/User/settings.json
