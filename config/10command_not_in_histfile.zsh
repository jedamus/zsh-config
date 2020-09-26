


# modifiziert Samstag, 26. September 2020 19:32 von Leander Jedamus

# All commands with space in front should not get into HISTFILE
setopt hist_ignore_space

for cmd in ls rm cd pwd wipe; do
  if [ -z "$aliases[$cmd]" ]; then
    eval "alias $cmd=' $cmd'"
  else
    eval "alias $cmd=' $aliases[$cmd]'"
  fi
done
