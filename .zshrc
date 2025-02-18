# ~/.zshrc
#echo "ich bin .zshrc"

# The following lines were added by compinstall
autoload -Uz compinit; compinit
#autoload -Uz promptinit; promptinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install

autoload zmv

target=`uname -s`
case $target in
  Darwin)
    export machtype="MacOS"
    ;;
  Linux)
    machtype=`uname -m`
    case $machtype in
      arm*) export machtype="Arm" ;;
      aarch64*) export machtype="Arm" ;;
      *)    export machtype="Linux" ;;
    esac
    ;;
  *)
    export machtype="unknown"
    ;;
esac

# echo $machtype

#set -x
if [ $machtype = "Linux" ]; then
  zstyle :compinstall filename '/home/leander/.zshrc'
fi
if [ $machtype = "Arm" ]; then
  zstyle :compinstall filename '/home/leander/.zshrc'
fi
if [ $machtype = "MacOS" ]; then
  zstyle :compinstall filename '/Users/leander/.zshrc'
fi
#set +x

export EXPORT="export"
export EQ="="
#source $HOME/.shlvl

if [ -z "$HAS_ENV" ]; then
  if [ $machtype = "MacOS" ]; then
    export PATH="/usr/local/texlive/2014/bin/x86_64-darwin:$PATH"
  fi

  source $HOME/.shenv
  export GPG_TTY=$( tty ) # GnuPG 2.1 with Git, problem in zsh

#  if [ -f $HOME/.use_ssh ]; then
#    eval "$(ssh-agent -s)"
#    ssh-add $HOME/.ssh/github
#  fi
fi
unset EXPORT EQ

infile=/etc/os-release
if [ -f $infile ]; then
  outfile=$(mktemp)
  cat $infile | sed -e "s/^/export /" > $outfile
  source $outfile
  rm -f $outfile
fi

if [ -n "$PS1" ]; then
  #PS1=$'%{\e[1;33;44m%}z%{\e[1;32;40m%}%n@%m%{\e[0m%} %T [%{\e[1;32;10m%}%c%{\e[0m%}] $ ';

  # eigene Funktionen in ~/zsh/functions autogeladen
  fpath=(~/.zsh/functions $fpath)
  autoload -U ${fpath[1]}/*(.N:t)

  for config in $HOME/.zsh/config/[0-9][0-9]*.zsh; do
    source $config
  done

  for output in $HOME/.zsh/output/[0-9][0-9]*.zsh; do
    source $output
  done

  #source $HOME/.zsh_prompt
  #source $HOME/.zsh_dircolors
  #source $HOME/.zsh_prompt_color

  # when there's "highlighters directory not found" error message
  # export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
  # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  if [ -z "$HAS_ENV" ]; then
    if [ $machtype = "Arm" ]; then
      if [ -f $HOME/mambaforge/condabin/conda ]; then
	echo -n "initializing mamba conda ... "

	cd $HOME
	# >>> conda initialize >>>
	__conda_setup="$('./mambaforge/condabin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	  eval "$__conda_setup"
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	echo "done\n"
      fi
    fi
    if [ $machtype = "Linux" ]; then
      if [ -f $HOME/anaconda3/bin/conda ]; then
	echo -n "initializing anaconda conda ... "

	cd $HOME
	# >>> conda initialize >>>
	__conda_setup="$('./anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	  eval "$__conda_setup"
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	echo "done\n"
      fi
    fi
  fi
fi

# pyenv
if [[ -x $HOME/.pyenv/bin/pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path -)"
fi


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export HAS_ENV="true"
#unset shlvl

#alias cls='clear'
#alias cd..='cd ..'
#alias ll='ls -la'
#alias md='mkdir'
#alias dir='ls -la'

export HISTFILE=~/.zsh_history
export HISTSIZE=20000
export SAVEHIST=20000
