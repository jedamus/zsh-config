

# erzeugt Montag, 26. Oktober 2020 18:21 (C) 2020 von Leander Jedamus
# modifiziert Montag, 26. Oktober 2020 19:47 von Leander Jedamus

run-with-sudo() { LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo
bindkey 's' run-with-sudo

capitalize-word() { LBUFFER[(w)-1]="${(C)LBUFFER[(w)-1]}" }
zle -N capitalize-word
bindkey 'c' capitalize-word

insert-date() { LBUFFER+="$(date \+%x)" }
zle -N insert-date
bindkey 'd' insert-date

get-help() {
  local cmd="$BUFFER[(w)-1]"
  zle push-line
  LBUFFER="$cmd --help | less"
}
zle -N get-help
bindkey 'h' get-help

global-alias-space() {
  local ga="$LBUFFER[(w)-1]"
  [[ -n $ga ]] && LBUFFER[(w)-1]="${${galiases[$ga]}:-$ga}"
  zle self-insert
}
zle -N global-alias-space
bindkey ' ' global-alias-space

does-not-work_overwrite-mode() {
  (( ${+mode} )) || local mode
  if [[ -z $mode ]]; then
    RPROMPT+=' (overwrite)'
    mode='overwrite'
  else
    RPROMPT="${RPROMPT% \(overwrite\)}"
    mode=''
  fi
  zle reset-prompt
  zle .overwrite-mode
}

# vim:ft=zsh ai sw=2 ts=2 et

