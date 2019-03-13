#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
export PATH="$PATH:$JAVA_HOME/bin"

# User made
# Gradlew
alias gbuild="./gradlew build"
alias gclean="./gradlew clean"
alias gdeploy="./gradlew deploy"
alias gstop="./gradlew --stop"

# Network
alias netstart="~/./git/bashrc/netstart.sh"

# Terminal
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%m-%d-%y %T "

# Misc
alias nqq="notepadqq"
alias sxf="startxfce4"
alias poweroff="systemctl poweroff"

# Exports
export PATH=$PATH:~/.local/bin
export EDITOR=nvim
