

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 27. Januar 2024 08:09 von Leander Jedamus
# modifiziert Mittwoch, 17. Januar 2024 08:42 von Leander Jedamus
# modifiziert Montag, 02. Mai 2022 20:25 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 17:17 von Leander Jedamus
# modifiziert Mittwoch, 02. Dezember 2020 13:57 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:48 von Leander Jedamus

alias -s txt=$EDITOR

alias -s tex=$EDITOR
alias -s sty=$EDITOR
alias -s cls=$EDITOR
alias -s pdf=evince
alias -s ps=evince
alias -s dvi=evince

alias -s c=$EDITOR
alias -s h=$EDITOR
alias -s hh=$EDITOR
alias -s cc=$EDITOR

alias -s de=$BROWSER
alias -s com=$BROWSER
alias -s org=$BROWSER
alias -s net=$BROWSER

. $HOME/bin/color_options.sh
alias grep="grep -i $color_options"
alias locate="locate -i"
alias ip="ip -h $color_options"
alias du="du -h"
alias df="df -h"

alias d="dirs -v"

if [[ -f /usr/bin/lxterminal ]]; then
  alias lt="lxterminal"
fi
if [[ -f /usr/bin/gnome-terminal ]]; then
    alias gt="gnome-terminal"
fi

alias cd..='cd ..'
alias cd...='cd ../..'
alias ...='cd ../..'

alias ll='ls -laF'
alias lt='ls -latrF'

alias md='mkdir'
alias rd='rmdir'
alias dir='ls -laF'
alias cls='clear'
#alias a2ps='a2ps.pl'

# see http://www.cl.cam.ac.uk/~mgk25/unicode.html#term for details
alias term2iso="echo 'Setting terminal to iso mode' ; print -n '\e%@'"
alias term2utf="echo 'Setting terminal to utf-8 mode'; print -n '\e%G'"

alias cp='nocorrect cp'           # no spelling correction on cp
alias mkdir='nocorrect mkdir -pv' # no spelling correction on mkdir and make parent directory
alias mv='nocorrect mv'           # no spelling correction on mv
alias rm='nocorrect rm -i'        # no spelling correction on rm

if [[ -f /usr/games/fortune ]]; then
  alias fl='fortune linux'
fi

# global aliases
alias -g L='|less'
alias -g NUL="> /dev/null 2>&1"

# vim:ai sw=2

