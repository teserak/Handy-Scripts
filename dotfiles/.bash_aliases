#!/bin/bash

alias ls="ls --color=auto --quoting-style=literal"
alias ll="ls -l"
alias lh="ls -lh"
alias la="ls -la"
alias lsnew=" ls -al --time-style=+%D | grep `date +%D` "
alias grep="grep --colour=auto -I"
alias egrep="egrep --colour=auto"
alias cfgrep='egrep -v "^[[:space:]]*($|#)"'

alias sp="./manage.py shell_plus"
alias rs="./manage.py runserver"
alias ds="./manage.py dbshell"

alias py2=". ~/.virtualenvs/scratch2/bin/activate"
alias py3=". ~/.virtualenvs/scratch3/bin/activate"

alias please='sudo $(fc -n -l -1)'
alias mpv-loud="mplayer -fs -af volume=+15dB "
alias yt="youtube-dl --format best --title "
alias servethis="python3 -m http.server"
