# prompt
setopt prompt_subst

# mode-aware arrow

function p_arrow {
  if [[ $KEYMAP = "vicmd" ]]; then
    echo "%F{magenta}»%f"
  else
    echo "%F{cyan}»%f"
  fi
}

# colored path

function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

# git info

function p_vcs {
  if ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    echo " %F{cyan}→ %F{green}$ref"
  else
    echo ""
  fi
}

# environments:
#  - ssh
#  - virtualenv
#  - cabal sandbox

export VIRTUAL_ENV_DISABLE_PROMPT=1

function p_envs {
  # check for cabal sandbox in parent directories, recursively
  local cabal
  cabal=( (../)#cabal.sandbox.config(N) )

  local envs
  [[ -n $SSH_CLIENT ]]  && envs+="R"
  (( $#cabal ))         && envs+="H"
  [[ -n $VIRTUAL_ENV ]] && envs+="P"

  [[ -n $envs ]] && echo " %F{green}[%f$envs%F{green}]%f"
}

function p_hour {
  echo "$(date '+%H:%M:%S')"
}

PROMPT='
%F{yellow}[$(p_hour)]%f %F{blue}λ%f $(p_colored_path)$(p_envs)$(p_vcs) $(p_arrow) '
