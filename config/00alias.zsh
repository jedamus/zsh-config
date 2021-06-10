

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
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

. $HOME/bin/my_options.sh
alias grep="grep -i $color_options"
alias ip="ip -h $color_options"
alias du="du -h"
alias df="df -h"

alias d="dirs -v"
alias gt="gnome-terminal"

alias cd..='cd ..'
alias cd...='cd ../..'
alias ...='cd ../..'

alias ll='ls -la'

alias md='mkdir'
alias rd='rmdir'
alias dir='ls -la'
alias cls='clear'
#alias a2ps='a2ps.pl'

# see http://www.cl.cam.ac.uk/~mgk25/unicode.html#term for details
alias term2iso="echo 'Setting terminal to iso mode' ; print -n '\e%@'"
alias term2utf="echo 'Setting terminal to utf-8 mode'; print -n '\e%G'"

alias cp='nocorrect cp'           # no spelling correction on cp
alias mkdir='nocorrect mkdir -pv' # no spelling correction on mkdir and make parent directory
alias mv='nocorrect mv'           # no spelling correction on mv
alias rm='nocorrect rm -i'        # no spelling correction on rm

if [ -f /usr/games/fortune ]; then
  alias fl='fortune linux'
fi

# global aliases
alias -g L='|less'
alias -g NUL="> /dev/null 2>&1"

# vim:ai sw=2

