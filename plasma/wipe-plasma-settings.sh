#!/bin/bash

rm -rf ~/.config/plasma*
rm -rf ~/.config/kde*
rm -rf ~/.local/share/kscreen
rm -rf ~/.cache/plasmashell*

rm -f ~/.config/baloofilerc
rm -f ~/.config/discoverrc
rm -f ~/.config/dolphinrc
rm -f ~/.config/drkonqirc
rm -f ~/.config/filetypesrc
rm -f ~/.config/kactivitymanagerd-statsrc
rm -f ~/.config/kactivitymanagerdrc
rm -f ~/.config/kcminputrc
rm -f ~/.config/kconf_updaterc
rm -f ~/.config/kglobalshortcutsrc
rm -f ~/.config/kmenueditrc
rm -f ~/.config/kscreenlockerrc
rm -f ~/.config/ksmserverrc
rm -f ~/.config/ktimezonedrc
rm -f ~/.config/kwalletmanagerrc
rm -f ~/.config/kwalletrc
rm -f ~/.config/kwinoutputconfig.json
rm -f ~/.config/kwinrc
rm -f ~/.config/kxkbrc
rm -f ~/.config/xdg-desktop-portal-kderc

echo "[Wallet]
Enabled=false" > ~/.config/kwalletrc
