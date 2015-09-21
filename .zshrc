# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ljedamus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ $SHLVL -eq 1 ]; then
  export PATH="$HOME/bin:/usr/local/texlive/2014/bin/x86_64-darwin:$PATH"
  export EXPORT="export"
  export EQ="="
  source $HOME/.env
  unset EXPORT EQ
fi

target=`uname -s`

case $target in
  Darwin)
    export machtype="MacOS"
    ;;
  *)
    export machtype="unknown"
    ;;
esac


if [ -n "$PS1" ]; then
  #PS1=$'%{\e[1;33;44m%}z%{\e[1;32;40m%}%n@%m%{\e[0m%} %T [%{\e[1;32;10m%}%c%{\e[0m%}] $ ';
  for config in $HOME/zsh/config/[0-9][0-9]*; do
    source $config
  done
  #source $HOME/.zsh_prompt
  #source $HOME/.zsh_dircolors
  #source $HOME/.zsh_prompt_color

  # eigene Funktionen in ~/zsh/functions autogeladen
  fpath=(~/zsh/functions $fpath)
  autoload -U ${fpath[1]}/*(.N:t)

  if [ -n "$DISPLAY" ]; then
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
    vagrant ssh telnet su bash zsh tcsh()
    {
      set_title "$0 $@"
      {
        command $0 "$@"
      } always {
        cd .
      }
    };# ssh()
  fi
fi

#alias rm='rm -i'
#alias cls='clear'
#alias cd..='cd ..'
#alias ll='ls -la'
#alias md='mkdir'
#alias dir='ls -la'
