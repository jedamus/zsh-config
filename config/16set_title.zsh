

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Montag, 26. September 2022 15:38 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 13:44 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 19:34 von Leander Jedamus

if [[ -n "$DISPLAY" ]]; then
  set_title()
  {
    echo -n "\e]2;${@}\007"
  };# set_title()
  functions[chpwd]="set_title \"\$USER@\$HOST:\$PWD\";$functions[chpwd]"
  # chpwd()
  # {
    # set_title "${USER}@${HOST}:${PWD}"
  # };# chpwd()
  cd .
  vagrant ssh telnet su sudo bash zsh csh tcsh screen tmux byobu docker ipython()
  {
    set_title "$0 $@"
    {
      command $0 "$@"
    } always {
      cd .
    }
  };# ssh()
fi

# vim:ai sw=2

