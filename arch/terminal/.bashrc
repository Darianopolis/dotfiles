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

# Add user package locations

export PATH="~/.local/bin:$PATH:$HOME/go/bin"
export LD_LIBRARY_PATH="/usr/local/lib"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
