# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

target=`uname -s`
case $target in
  Darwin)
    export machtype="MacOS"
    ;;
  Linux)
    export machtype="Linux"
    ;;
  *)
    export machtype="unknown"
    ;;
esac

#set -x
if [ $machtype = "Linux" ]; then
  zstyle :compinstall filename '/home/leander/.zshrc'
fi
if [ $machtype = "MacOS" ]; then
  zstyle :compinstall filename '/Users/leander/.zshrc'
fi
#set +x

# The following lines were added by compinstall
autoload -Uz compinit; compinit
#autoload -Uz promptinit; promptinit
# End of lines added by compinstall

if [ $SHLVL -eq 1 ]; then
  if [ $machtype = "MacOS" ]; then
    export PATH="/usr/local/texlive/2014/bin/x86_64-darwin:$PATH"
  fi

  export EXPORT="export"
  export EQ="="
  source $HOME/.env
  unset EXPORT EQ
  export GPG_TTY=$( tty ) # GnuPG 2.1 with Git, problem in zsh
fi

if [ -n "$PS1" ]; then
  #PS1=$'%{\e[1;33;44m%}z%{\e[1;32;40m%}%n@%m%{\e[0m%} %T [%{\e[1;32;10m%}%c%{\e[0m%}] $ ';

  # eigene Funktionen in ~/zsh/functions autogeladen
  fpath=(~/zsh/functions $fpath)
  autoload -U ${fpath[1]}/*(.N:t)

  for config in $HOME/zsh/config/[0-9][0-9]*.zsh; do
    source $config
  done

  for output in $HOME/zsh/output/[0-9][0-9]*.zsh; do
    source $output
  done

  #source $HOME/.zsh_prompt
  #source $HOME/.zsh_dircolors
  #source $HOME/.zsh_prompt_color

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
    vagrant ssh telnet su bash zsh tcsh screen tmux byobu()
    {
      set_title "$0 $@"
      {
        command $0 "$@"
      } always {
        cd .
      }
    };# ssh()
    # when there's "highlighters directory not found" error message
    # export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
    # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

#alias cls='clear'
#alias cd..='cd ..'
#alias ll='ls -la'
#alias md='mkdir'
#alias dir='ls -la'
