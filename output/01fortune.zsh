

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 21:24 von Leander Jedamus

if [ $SHLVL -eq 1 ]; then
  FORTUNE=/usr/games/fortune
  NL="-n"
  if [ -x $FORTUNE ]; then
    echo -n "${fg[blue]}"
    #$FORTUNE -s
    $FORTUNE linux
    echo -n "${fg[default]}"
    NL=""
  fi
  echo $NL
  unset FORTUNE NL
fi

# vim:ai sw=2

