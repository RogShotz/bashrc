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
alias nqq="notepadqq"
alias sxf="startxfce4"
alias gbuild="./gradlew build"
alias gclean="./gradlew clean"
alias gdeploy="./gradlew deploy"
# Todo: make netctl script that execs a list, then you choose via number then stops all then starts
# alias netstart="stat -c "%F %n" * | grep "regular file" | cut -d' ' -f 3- && sudo netctl stop-all && sudo netctl start /etc/netctl"

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%m-%d-%y %T "
export PATH=$PATH:~/.local/bin
export EDITOR=nvim
