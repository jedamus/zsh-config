#!/usr/bin/env zsh

# erzeugt Montag, 14. Dezember 2020 14:40 (C) 2020 von Leander Jedamus
# modifiziert Sonntag, 03. April 2022 09:54 von Leander Jedamus
# modifiziert Sonntag, 03. April 2022 09:51 von Simone Kalisch
# modifiziert Sonntag, 03. April 2022 08:48 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 14:48 von Leander Jedamus

mkdir -p $HOME/bin

#set -x

python=( "python3" "python2" )
version=2

for py in $python; do
  if [[ ! -z $found ]]; then
    break;
  fi
  for dir in $path; do
    if [[ ! -z $found ]]; then
      break;
    fi
    
    if [[ -x $dir/$py ]]; then
      if [[ $python[1] == $py ]]; then
        version=3
	echo "Found $($dir/$py --version)"
	found=TRUE
      else
        version=2
	tmpfile=/tmp/install_zsh_tmpfile.$$
	echo "Found $($dir/$py --version 2> $tmpfile ; cat $tmpfile ; rm $tmpfile)"
	found=TRUE
      fi
    fi
  done
done

cp -vp zshprompt$version.py $HOME/bin/zshprompt.py
cp -vp color_options.sh $HOME/bin
cp -vp .zshrc .shenv $HOME

# vim:ai sw=2

