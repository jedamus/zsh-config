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

alias d="dirs -v"
alias grep="grep -i --color=auto"
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

alias fl='fortune linux'

# global aliases
alias -g L='|less'
alias -g NUL="> /dev/null 2>&1"
