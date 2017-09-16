if [ $SHLVL -eq 1 ]; then
  UPTIME=/usr/bin/uptime
  NL="-n"
  if [ -x $UPTIME ]; then
    echo -n "${bg[blue]}${fg[yellow]}"
    $UPTIME
    echo -n "${bg[default]}${fg[default]}"
    NL=""
  fi
  echo $NL
  unset UPTIME NL
fi
