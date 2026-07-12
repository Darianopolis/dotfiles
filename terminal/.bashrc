# Aliases

alias ls='ls --color=auto --all'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias cls="printf '\033[2J\033[3J\033[1;1H'"
PS1='[\u@\h \W]\$ '

# History

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="li:ls:ll:git status:pwd:rm"
export HISTCONTROL=ignoredups

# Desktop Environment

export WALLPAPER='/media/home/Media/wallpapers/the-valley-minimal-4k-9y-120713155.jpg'

export XCURSOR_THEME="breeze_cursors"
export XCURSOR_SIZE=24

alias  plasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias xplasma='startx /usr/bin/startplasma-x11'

# Paths

export PATH="$HOME/.local/bin:$PATH:$HOME/go/bin"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Toolkit platform hints

export SDL_VIDEO_DRIVER="wayland"
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# Ls Interactive

alias li='. ls-interactive.sh'

# Editors

alias zed=zeditor

export VSCODE_USE_WAYLAND=1
if [ $VSCODE_USE_WAYLAND == "1" ]; then
    alias code="env -u DISPLAY ELECTRON_OZONE_PLATFORM_HINT=wayland code --ozone-platform=wayland"
else
    alias code="env -u WAYLAND_DISPLAY ELECTRON_OZONE_PLATFORM_HINT=x11 code --ozone-platform=x11"
fi

# Development Tools

export PATH="$PATH:$HOME/.dotnet/tools"

alias renderdoc='QT_QPA_PLATFORM=xcb $HOME/dev/renderdoc/build/bin/qrenderdoc'

alias scc='scc --no-cocomo'

# Git

export GCM_CREDENTIAL_STORE=secretservice

alias git-fixup='git commit --amend --no-edit'
