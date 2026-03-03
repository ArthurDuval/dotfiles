#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1=' \[\e[1;92m\]\W \[\e[1;96m\]|>\[\e[0m\] '
