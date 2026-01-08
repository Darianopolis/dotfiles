#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Shell launch

alias  plasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias xplasma='startx /usr/bin/startplasma-x11'

# Aliases

alias ls='ls --color=auto --all'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias cls="printf '\033[2J\033[3J\033[1;1H'"
PS1='[\u@\h \W]\$ '

# Bash history

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="ls:ll:clear:git status:pwd:fastfetch"
export HISTCONTROL=ignoredups

# ------------------------------------------------------------------------------

export XCURSOR_THEME="breeze_cursors"

# ------------------------------------------------------------------------------

export PATH="$HOME/.local/bin:$PATH:$HOME/go/bin"
# export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# ------------------------------------------------------------------------------

# export SDL_VIDEO_DRIVER="wayland"

# ------------------------------------------------------------------------------

export PATH="$PATH:$HOME/.dotnet/tools"

# ------------------------------------------------------------------------------

# export CC=clang
# export CXX=clang

# ------------------------------------------------------------------------------

. li-bashrc

# ------------------------------------------------------------------------------

alias zed=zeditor

# ------------------------------------------------------------------------------

# export PATH="$HOME/.mypython/bin:$PATH"

# ------------------------------------------------------------------------------

alias renderdoc='QT_QPA_PLATFORM=xcb $HOME/dev/renderdoc/build/bin/qrenderdoc'

# ------------------------------------------------------------------------------

export GIT_CACHE_DIR="$HOME/.gitcache"

# ------------------------------------------------------------------------------

export PATH="$PATH:$HOME/dev/VulkanTools/build/vkconfig_cmd"

# ------------------------------------------------------------------------------

# export ELECTRON_OZONE_PLATFORM_HINT="auto"

# ------------------------------------------------------------------------------

# alias code='env -u DISPLAY ELECTRON_OZONE_PLATFORM_HINT=wayland code --ozone-platform=wayland'

# ------------------------------------------------------------------------------

alias scc='scc --no-cocomo'
alias sccf='scc --no-cocomo --by-file'

export WALLPAPER='/media/home/Media/wallpapers/the-valley-minimal-4k-9y-120713155.jpg'

# ------------------------------------------------------------------------------

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
