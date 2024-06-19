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

alias ls='ls --color=auto --all'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Starship prompt
eval "$(starship init bash)"

# Show fastfetch
fastfetch

echo ""

# ble.sh auto suggestions
source /usr/share/blesh/ble.sh