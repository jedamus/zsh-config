


# modifiziert Samstag, 26. September 2020 19:32 von Leander Jedamus

DIRSTACKSIZE=20
DIRSTACKFILE=$HOME/.zsh_dirs

if [[ -f $DIRSTACKFILE ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    # "cd -" won't work after login by just setting $OLDPWD, so
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

#uprint () {
#  emulate -L zsh
#  local -a u
#  local w
#  local parameter=$1
#
#  if [[ -z ${parameter} ]] ; then
#    printf 'usage: uprint <parameter>\n'
#    return 1
#  fi
#
#  for w in ${(P)parameter} ; do
#    [[ -z ${(M)u:#$w} ]] && u=( $u $w )
#  done
#
#  builtin print -l $u
#}

chpwd() {
    local -ax my_stack
    my_stack=( $PWD $dirstack )
    builtin print -l ${(u)my_stack} >! $DIRSTACKFILE
    # uprint my_stack >! $DIRSTACKFILE
}

