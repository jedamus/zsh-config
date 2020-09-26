

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:37 von Leander Jedamus

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
