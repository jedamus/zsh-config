


# modifiziert Samstag, 26. September 2020 19:33 von Leander Jedamus

export OLDPROMPT=$PROMPT
export OLDRPROMPT=$RPROMPT
precmd() {
  stat=$?
  prmt=$HOME/bin/zshprompt.py
  if [[ -d ./.git ]]; then
    export PROMPT="${$($prmt left):-$PROMPT}"
    export RPROMPT="${$($prmt right --last-exit-status $stat):-$RPROMPT}"
  else
    export PROMPT=$OLDPROMPT
    export RPROMPT=$OLDRPROMPT
  fi
}
