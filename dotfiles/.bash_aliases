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
alias rs="DJANGO_LOG_LEVEL=INFO ./manage.py runserver"
alias ds="./manage.py dbshell"

alias py2=". ~/.virtualenvs/scratch2/bin/activate"
alias py3=". ~/.virtualenvs/scratch3/bin/activate"

alias please='sudo $(fc -n -l -1)'
alias mpv-loud="mplayer -fs -af volume=+15dB "
alias yt="youtube-dl --format best -o '%(title)s-%(id)s.%(ext)s' "
alias servethis="python3 -m http.server"

alias docker-cleanup="docker ps --filter 'status=exited' | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm"
alias python-cleanup="rm \$(find . -name '*.pyc')"

# Thanks to Cory Doctorow for this one: https://twitter.com/doctorow/status/866774675317305344?s=09
alias subvert-tether="sudo sysctl net.ipv4.ip_default_ttl=65"

function rebuild-virtualenv {
  local path=${VIRTUAL_ENV}
  local version=$(python --version | sed -e 's/.* \(.\).*/\1/')
  deactivate
  rm -irf ${path}
  virtualenv --python python${version} ${path}
  . ${path}/bin/activate
}

function comcast {
  local device=$(netstat -rn | egrep "^0\.0\.0\.0" | awk '{print $8}')
  if [[ "${1}" = "fucked" ]]; then
    echo "Welcome to Australia!"
    sudo tc qdisc add dev ${device} root netem delay 100ms
  else
    echo "Removing network crippling"
    sudo tc qdisc delete dev ${device} root
  fi
}
