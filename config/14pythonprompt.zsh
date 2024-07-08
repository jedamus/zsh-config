

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Montag, 08. Juli 2024 09:35 von Leander Jedamus
# modifiziert Sonntag, 07. Juli 2024 09:02 von Leander Jedamus
# modifiziert Sonntag, 30. Juni 2024 06:16 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:51 von Leander Jedamus

virtualenv_prompt() {
  # If not in a virtualenv, print nothing
  [[ "${VIRTUAL_ENV}" == "" ]] && return

  # Distinguish between the shell where the virtualenv was activated
  # and its children
  local venv_name="${VIRTUAL_ENV##*/}"
  if typeset -f deactivate >/dev/null; then
    echo "${fgp[green]}[${fgp[white]}${venv_name}${fgp[green]}]${fgp[default]} "
  else
    echo "${fgp[green]}<${fgp[white]}${venv_name}${fgp[green]}>${fgp[default]} "
  fi
}

export OLDPROMPT=$PROMPT
export OLDRPROMPT=$RPROMPT
precmd() {
  stat=$?
  prmt=$HOME/bin/zshprompt.py
  if [[ -d ./.git ]]; then
    export PROMPT="${$($prmt left):-$PROMPT}"
    export RPROMPT="${$($prmt right --last-exit-status $stat):-$RPROMPT}"
  else
    #export PROMPT=$OLDPROMPT
    export PROMPT="$COLOUR_PROMPT"
    export RPROMPT="$(virtualenv_prompt)$OLDRPROMPT"
  fi
}

# vim:ai sw=2

