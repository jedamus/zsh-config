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