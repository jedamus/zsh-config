

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Montag, 26. Oktober 2020 10:16 von Leander Jedamus
# modifiziert Freitag, 23. Oktober 2020 11:25 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:50 von Leander Jedamus

autoload -U compinit && compinit

zmodload -i zsh/complist

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''

#lj2018
zstyle ':completion:*' format %d
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

#lj2015:

if [ $machtype != "MacOS" ];then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*' show-ambiguity $color[bg-red]
fi

zstyle ':completion:*' accept-exact false

if [ $machtype != "MacOS" ];then
  # reverse video für ...
  zstyle ':completion:*:descriptions' format '%S%d%s'
  zstyle ':completion:*:corrections' format '%S%d (errors: %e)%s'
  zstyle ':completion:*:messages' format '%S%d%s'
  zstyle ':completion:*:warnings' format '%S%d%s'
else
  zstyle ':completion:*:descriptions' format '%B%d%b'
  zstyle ':completion:*:messages' format %d
  zstyle ':completion:*:warnings' format 'No matches for: %d'
fi

zstyle ':completion:*:(all-|)files' ignored-patterns \
  "(*.BAK|*.bak|*.o|*.aux|*.toc|*.idx|*.ind|*.ilg|*.lof|*.lot|*.swp|*~)"

# löscht die Patterns für rm
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns

zstyle ':completion:*' menu select=3

if [ $machtype != "MacOS" ];then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# fehler tolerieren
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion::complete:*' use-cache on
zstyle -e ':completion:*:approximate:*' max-errors \
  'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# von mir: ##+## evince einstellen
if [ $machtype != "MacOS" ];then
  zstyle ':completion:*:*:evince:*:*' file-patterns \
        "(*.pdf|*.ps|*.dvi|*.png|*.gif)" "*(-/)"
fi

zstyle ':completion:*:vi(|m):*:*' file-patterns '*.tex' '*.(c|cc|cpp|c++|h|hh|py|pl|sh|java|cob|f)' '*'

zstyle ':completion:*:*:sudo:*' command-path /sbin /usr/sbin /usr/local/sbin \
                                             $path

#zstyle ':completion:*:*:a2ps:*:*' file-patterns \
#  "(\.*|*.txt|*.sh|*.pl|*.py)" "*(-/)"
zstyle ':completion:*:*:a2ps:*:*' none

# 2016
zstyle ':completion:*:zplugin:argument-rest:*' list-colors \
      '=(#b)(*)/(*)==1;35=1;33'

#lj2020: complete after redirecting (">") with *.log
#zstyle ':completion:*:*:-redirect-,>,*:*' file-patterns '*.log'

# vim:ai sw=2

