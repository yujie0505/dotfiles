# TODO: modify variable `VENV_HOMES` to specify multiple paths containing virtual environments, with each path separated by a `:`
VENV_HOMES="$HOME/.venv:$HOME/tmp/venv"

function cd {
  builtin cd "$@" || return 1
  ls

  # Activate virtual environment

  local current_dir
  local delimiter
  local new_virtual_env
  local venv_homes

  current_dir=$(pwd)
  delimiter=':'
  if [ "$(basename "$SHELL")" = 'zsh' ]; then
    IFS="$delimiter" read -r -A venv_homes <<<"$VENV_HOMES"
  else
    IFS="$delimiter" read -r -a venv_homes <<<"$VENV_HOMES"
  fi

  # TODO: auto-detect virtual environment name from command `poetry env info --path`
  while [ "$(expr "//$current_dir" : "//$HOME")" -gt 0 ]; do
    # Comply with PEP 405 – Python Virtual Environments (https://peps.python.org/pep-0405/)
    if [ -d "$current_dir/.venv" ] && [ -f "$current_dir/.venv/pyvenv.cfg" ]; then
      new_virtual_env="$current_dir/.venv"
    elif [ -f "$current_dir/.venv" ]; then
      local venv_name
      venv_name=$(cat "$current_dir/.venv")
      for venv_home in "${venv_homes[@]}"; do
        if [ -d "$venv_home/$venv_name" ] && [ -f "$venv_home/$venv_name/pyvenv.cfg" ]; then
          new_virtual_env="$venv_home/$venv_name"
          break
        fi
      done
      if [ -z "$new_virtual_env" ]; then
        echo "The virtual environment is invalid or missed. Please verify the contents of the $current_dir/.venv file."
        return 1
      fi
    fi

    if [ -n "$new_virtual_env" ]; then
      if [ -v VIRTUAL_ENV ]; then
        if [ "$new_virtual_env" != "$VIRTUAL_ENV" ]; then
          deactivate && . "$new_virtual_env/bin/activate"
        fi
      else
        . "$new_virtual_env/bin/activate"
      fi
      return 0
    fi

    current_dir=$(dirname "$current_dir")
  done
  if [ -v VIRTUAL_ENV ]; then
    deactivate
  fi
}

function rm {
  while [ "$#" -ge 1 ]; do
    mv -f "$1" "$HOME/tmp/"
    echo "$1 deleted."
    shift
  done
}

function rrm {
  /bin/rm -i "$@"
}

alias cp='cp -i'
alias mv='mv -i'
