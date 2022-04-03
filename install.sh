#!/usr/bin/env sh

# erzeugt Montag, 14. Dezember 2020 14:40 (C) 2020 von Leander Jedamus
# modifiziert Sonntag, 03. April 2022 08:48 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 14:48 von Leander Jedamus

mkdir -p $HOME/bin

version=2

tmpfile2=/tmp/check_python2.tmp.$$
tmpfile3=/tmp/check_python3.tmp.$$

lines2=$(LANG=C /usr/bin/env python2 --version 2> $tmpfile2 ; cat $tmpfile2 ; rm $tmpfile2)
lines3=$(LANG=C /usr/bin/env python3 --version 2> $tmpfile3 ; cat $tmpfile3 ; rm $tmpfile3)

#echo "python2: $lines2"
#echo "python3: $lines3"

if [ "$lines2" != "/usr/bin/env: 'python2': No such file or directory" ]; then
  if [ "$lines2" != "env: python2: No such file or directory" ]; then
    if [ "$lines2" != "/usr/bin/env: „python2“: Datei oder Verzeichnis nicht gefunden" ]; then
      if [ "$lines2" != "/usr/bin/env: „python2“: No such file or directory" ]; then
        echo "Found python2."
	version=2
      fi
    fi
  fi
fi

if [ "$lines3" != "/usr/bin/env: 'python3': No such file or directory" ]; then
  if [ "$lines3" != "env: python3: No such file or directory" ]; then
    if [ "$lines3" != "/usr/bin/env: „python3“: Datei oder Verzeichnis nicht gefunden" ]; then
      if [ "$lines3" != "/usr/bin/env: „python3“: No such file or directory" ]; then
        echo "Found python3."
	version=3
      fi
    fi
  fi
fi

cp -vp zshprompt$version.py $HOME/bin/zshprompt.py
cp -vp color_options.sh $HOME/bin
cp -vp .zshrc .shenv .shlvl $HOME

# vim:ai sw=2

