eval "$(docker-machine env default --shell=zsh)"
alias dm="docker-machine"

alias dstop='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'
alias dsr='dstop && drm'
alias d="docker"
alias dpa="docker ps -a"
alias dclean="dstop && drm"

alias dc="docker-compose"

function dockerized-path() {
  echo "/$(cygpath -wa $1 | sed 's/://g' | sed 's/\\/\//g' | sed 's/^C/c/g')"
}

alias dockpwd="dockerized-path"
