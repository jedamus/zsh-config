

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 21:24 von Leander Jedamus

if [ $SHLVL -eq 1 ]; then
  TODO=$HOME/todo.txt
  NL="-n"
  if [ -f $TODO ]; then
    echo -n "${fg[red]}"
    echo "TODO-List:"
    cat $TODO
    echo -n "${fg[default]}"
    NL=""
  fi
  echo $NL
  unset TODO NL
fi

# vim:ai sw=2

