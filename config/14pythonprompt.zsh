

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
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
    echo "[${venv_name}] "
  else
    echo "<${venv_name}> "
  fi
}

export OLDPROMPT=$PROMPT
export OLDRPROMPT=$RPROMPT
precmd() {
  PS1="$(virtualenv_prompt)${fgp[yellow]}${bgp[blue]}z${fgp[blue]}${bgp[yellow]}%n@%m${fgp[default]}${bgp[default]} %T (%!) %(!.#.$) "
  stat=$?
  prmt=$HOME/bin/zshprompt.py
  if [[ -d ./.git ]]; then
    export PROMPT="${$($prmt left):-$PROMPT}"
    export RPROMPT="${$($prmt right --last-exit-status $stat):-$RPROMPT}"
  else
    #export PROMPT=$OLDPROMPT
    export PROMPT="$(virtualenv_prompt)${fgp[yellow]}${bgp[blue]}z${fgp[blue]}${bgp[yellow]}%n@%m${fgp[default]}${bgp[default]} %T (%!) %(!.#.$) "
    export RPROMPT=$OLDRPROMPT
  fi
}

# vim:ai sw=2

