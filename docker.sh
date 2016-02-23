alias dstop='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'
alias dsr='dstop && drm'
alias d="docker"
alias dpa="docker ps -a"
alias dclean="dstop && drm"

alias dm="docker-machine"
alias dc="docker-compose"

