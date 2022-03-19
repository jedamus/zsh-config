

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:49 von Leander Jedamus

color_cmd() {
  res=$(builtin type $1 2>/dev/null)
  [[ -z $res ]] && return
  case $res in
    *'reserved word'*)  color='magenta' ;;
    *'an alias'*)       color='cyan'    ;;
    *'shell builtin'*)  color='yellow'  ;;
    *'shell function'*) color='green'   ;;
    *"$cms is"*)        color='blue'    ;;
    *)                  color='red'
  esac
  case $cmd in
    'sudo')   state=1 ;;
    'start')  state=1 ;;
    'time')   state=1 ;;
    'strace') state=1 ;;
    *)        state=2
  esac
}

color_arg() {
  case $1 in
    '--'*) color='magenta' ;;
    '-'*)  color='cyan'    ;;
    *)     color='red'
  esac
}

color_string() {
  case $1 in
    '"'*) color='yellow' ;;
    "'"*) color='yellow' ;;
    *)       color=''
  esac
}

recolor-cmd() {
  args=(${(z)BUFFER})
  offset=0
  state=1
  region_highlight=()
  for cmd in $args; do
    if [[ $state -eq 1 ]]; then
      color_cmd $cmd
    elif [[ $state -eq 2 ]]; then
      color_arg $cmd
      if [[ "$color" =~ 'red' ]]; then
        color_string $cmd
      fi
    fi
    if [[ -n "$color" ]]; then
      region_highlight=($region_highlight "$offset $((${#cmd}+offset))
fg=${color},bold")
    fi
    offset=$((offset+${#cmd}+1))
    case $cmd in
      *'|')  state=1 ;;
      *'&')  state=1 ;;
      *';')  state=1 ;;
    esac
  done
}

check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
#check-cmd-expand-or-complete() { zle .expand-or-complete } # && recolor-cmd }

zle -N self-insert check-cmd-self-insert
#zle -N expand-or-complete check-cmd-expand-or-complete
zle -N backward-delete-char check-cmd-backward-delete-char

# vim:ai sw=2

