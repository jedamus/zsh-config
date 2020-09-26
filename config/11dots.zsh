

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:50 von Leander Jedamus

# ESC 4. erzeugt ../../../..
# ^X. gibt Pfad aus
dotdot() {
 if (( NUMERIC > 0 ))
 then LBUFFER+=..; repeat $((NUMERIC-1)) LBUFFER+=/..
 else LBUFFER+=.
 fi
}
zle -N dotdot
bindkey . dotdot

function _showcurrargrealpath() {
  setopt localoptions nonomatch
  local REPLY REALPATH
  _split_shell_arguments_under
  #zle -M "$(realpath ${(Q)${~REPLY}} 2> /dev/null | head -n1 || echo 1>&2 "No such path")"
  REALPATH=( ${(Q)${~REPLY}}(N:A) )
  zle -M "${REALPATH:-Path not found: $REPLY}"
}
zle -N _showcurrargrealpath
bindkey "^X." _showcurrargrealpath

# which i now notice in turn relies on this bit:
autoload -U modify-current-argument
autoload -U split-shell-arguments

function _split_shell_arguments_under()
{
  local -a reply
  integer REPLY2
  split-shell-arguments
  #have to duplicate some of modify-current-argument to get the word
  #_under_ the cursor, not after.
  setopt localoptions noksharrays multibyte
  if (( REPLY > 1 )); then
    if (( REPLY & 1 )); then
      (( REPLY-- ))
    fi
  fi
  REPLY=${reply[$REPLY]}
}

# vim:ai sw=2

