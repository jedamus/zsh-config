

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 03:37 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 21:24 von Leander Jedamus

fort() {
  FORTUNE=/usr/games/fortune
  NL="-n"
  if [ -x $FORTUNE ]; then
    echo -n "${fg[blue]}"
    #$FORTUNE -s
    $FORTUNE $@
    echo -n "${fg[default]}"
    NL=""
  fi
  echo $NL
  unset FORTUNE NL
};# fort()

if [ $SHLVL -eq 1 ]; then
  fort linux
fi

# vim:ai sw=2

