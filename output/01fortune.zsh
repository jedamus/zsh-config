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
