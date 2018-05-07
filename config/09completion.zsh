autoload -U compinit && compinit

zmodload -i zsh/complist

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''

#lj2015:
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' show-ambiguity $color[bg-red]

zstyle ':completion:*' accept-exact false

# reverse video für ...
zstyle ':completion:*:descriptions' format '%S%d%s'
zstyle ':completion:*:corrections' format '%S%d (errors: %e)%s'
zstyle ':completion:*:messages' format '%S%d%s'
zstyle ':completion:*:warnings' format '%S%d%s'

zstyle ':completion:*:(all-|)files' ignored-patterns \
  "(*.BAK|*.bak|*.o|*.aux|*.toc|*.idx|*.ind|*.ilg|*.lof|*.lot|*.swp|*~)"

# löscht die Patterns für rm
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns

zstyle ':completion:*' menu select=3

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# fehler tolerieren
zstyle ':completion:*' completer _complete _correct _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
  'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# von mir: ##+## evince einstellen
zstyle ':completion:*:*:evince:*:*' file-patterns \
  "(*.pdf|*.ps|*.dvi|*.png|*.gif)" "*(-/)"

zstyle ':completion:*:vi(|m):*:*' file-patterns '*.tex' '*.(c|cc|cpp|c++|h|hh|py|pl|sh|java|cob|f)' '*'

zstyle ':completion:*:*:sudo:*' command-path /sbin /usr/sbin /usr/local/sbin \
                                             $path

#zstyle ':completion:*:*:a2ps:*:*' file-patterns \
#  "(\.*|*.txt|*.sh|*.pl|*.py)" "*(-/)"
zstyle ':completion:*:*:a2ps:*:*' none

# 2016
zstyle ':completion:*:zplugin:argument-rest:*' list-colors \
      '=(#b)(*)/(*)==1;35=1;33'
