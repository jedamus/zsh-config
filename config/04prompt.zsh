

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:49 von Leander Jedamus

# colors

autoload -U colors
colors

# fgp is an associative array
typeset -A fgp
for i in ${(k)fg};fgp[$i]=%{${fg[$i]}%}

# bgp is an associative array
typeset -A bgp
for i in ${(k)bg};bgp[$i]=%{${bg[$i]}%}

export PS1="${fgp[yellow]}${bgp[blue]}z${fgp[blue]}${bgp[yellow]}%n@%m${fgp[default]}${bgp[default]} %T (%!) %(!.#.$) ";
export RPROMPT="${fgp[green]}%4~${fgp[default]}${fgp[red]}%(?.. :( %?)${fgp[default]}";

# vim:ai sw=2

