function docker_machine_wrapper() {
  eval "$(docker-machine $@)"
}
alias dm="docker_machine_wrapper"

alias dstop='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'
alias dsr='dstop && drm'
alias d="docker"
alias dpa="docker ps -a"
alias dclean="dstop && drm"

alias dc="docker-compose"

