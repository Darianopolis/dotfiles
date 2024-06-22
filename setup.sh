# TODO: Backup or prompt on overriding previous files

cd "$(dirname "$0")"

echo "Setting up dotfiles from: $(pwd)"

ln -fs $(pwd)/.bashrc ~/.bashrc
ln -fs $(pwd)/.blerc ~/.blerc
ln -f  $(pwd)/kitty.conf ~/.config/kitty/kitty.conf
ln -fs $(pwd)/vscode.json $HOME/.config/Code\ -\ OSS/User/settings.json
