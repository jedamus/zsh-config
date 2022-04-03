#!/usr/bin/env sh

# erzeugt Montag, 14. Dezember 2020 14:40 (C) 2020 von Leander Jedamus
# modifiziert Sonntag, 03. April 2022 06:34 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 14:48 von Leander Jedamus

mkdir -p $HOME/bin

version=2
if [ -x /usr/local/bin/python3 ]; then
  echo "found python3"
  version=3
fi
if [ -x /usr/bin/python3 ]; then
  echo "found python3"
  version=3
fi

cp -vp zshprompt$version.py $HOME/bin/zshprompt.py
cp -vp color_options.sh $HOME/bin
cp -vp .zshrc .shenv .shlvl $HOME

# vim:ai sw=2

