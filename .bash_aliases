function cd {
	builtin cd "$@"
	ls

	# Activate virtual environment

	VENV_HOME="$HOME/.venv"

	unset NEW_VIRTUAL_ENV
	CURRENT_DIR=$(pwd)
	while [ "$(expr $CURRENT_DIR : $HOME)" -gt 0 ]; do
		# Comply with PEP 405 – Python Virtual Environments (https://peps.python.org/pep-0405/)
		if [ -d "$CURRENT_DIR/.venv" ] && [ -f "$CURRENT_DIR/.venv/pyvenv.cfg" ]; then
			NEW_VIRTUAL_ENV="$CURRENT_DIR/.venv"
		elif [ -f "$CURRENT_DIR/.venv" ]; then
			NEW_VIRTUAL_ENV="$VENV_HOME/$(cat $CURRENT_DIR/.venv)"
			if [ ! -f "$NEW_VIRTUAL_ENV/pyvenv.cfg" ]; then
				echo "The virtual environment configuration at the specified path is invalid. Please verify the contents of the .venv file."
				return 1
			fi
		fi

		if [ -v NEW_VIRTUAL_ENV ]; then
			if [ -v VIRTUAL_ENV ]; then
				if [ "$NEW_VIRTUAL_ENV" != "$VIRTUAL_ENV" ]; then
					deactivate && . "$NEW_VIRTUAL_ENV/bin/activate"
				fi
			else
				. "$NEW_VIRTUAL_ENV/bin/activate"
			fi
			return 0
		fi

		CURRENT_DIR=$(dirname "$CURRENT_DIR")
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
