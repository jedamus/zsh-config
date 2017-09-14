# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
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

# The following lines were added by compinstall
if [[ $machtype == "MacOS" ]]; then
  zstyle :compinstall filename '/home/cabox/.zshrc'
else
  zstyle :compinstall filename '/Users/leander/.zshrc'
fi

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ $SHLVL -eq 1 ]; then
  if [[ $machtype == "MacOS" ]]; then
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
  for config in $HOME/zsh/config/[0-9][0-9]*; do
    source $config
  done
  if [ $SHLVL -eq 1 ]; then 
    if [ -x /usr/games/fortune ]; then
      echo "${fg[cyan]}"
      /usr/games/fortune
      echo "${bg[default]}"
    fi

    TODO=$HOME/todo.txt
    if [ -f $TODO ]; then
      echo "${fg[yellow]}"
      echo "TODO-List:"
      cat $TODO
      echo "${bg[default]}"
    fi
    unset TODO
  fi

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
    # when there's "highlighters directory not found" error message
    # export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
    # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

#alias rm='rm -i'
#alias cls='clear'
#alias cd..='cd ..'
#alias ll='ls -la'
#alias md='mkdir'
#alias dir='ls -la'
