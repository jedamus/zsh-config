

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 21:25 von Leander Jedamus

if [ -z "$HAS_ENV" ]; then
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

# vim:ai sw=2

