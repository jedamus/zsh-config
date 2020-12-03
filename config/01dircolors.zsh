

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 16:37 von Leander Jedamus
# modifiziert Mittwoch, 02. Dezember 2020 19:44 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:49 von Leander Jedamus

if [ $machtype != "MacOS" ]; then
  typeset -A COLORS
  COLORS[ex]="00;32"
  COLORS[fi]="00"
  COLORS[no]="00"
  COLORS[di]="01;34"
  COLORS[ln]="target"
  COLORS[pi]="40;33"
  COLORS[so]="00;35"
  COLORS[bd]="40;33;01"
  COLORS[cd]="40;33;01"
  COLORS[or]="01;05;37;41"
  COLORS[mi]="01;05;37;41"

  COLORS[script]="00;32"
  COLORS[archive]="01;31"
  COLORS[packet]="01;30"
  COLORS[java]="00;36"
  COLORS[image]="00;35"
  COLORS[backup]="04"
  COLORS[readme]="31;04"
  COLORS[source]="31"
  COLORS[preprocessed]="31"
  COLORS[object]="34"
  COLORS[library]="34"
  COLORS[header]="33"
  COLORS[doc]="33"
  COLORS[build]="31;43"
  COLORS[markup]="00;32"
  COLORS[audio]="33;04"
  COLORS[video]="35;04"
  COLORS[diff]="00;35"
  COLORS[printable]="33;02"

  # linux: typeset -xUT LS_COLORS ls_colors
  # mac os: typeset -xUT LSCOLORS ls_colors
  typeset -xUT LS_COLORS ls_colors
  ls_colors=(
      # meta
      "no=${COLORS[no]}"
      "fi=${COLORS[fi]}"
      "di=${COLORS[di]}"
      "ln=${COLORS[ln]}"
      "pi=${COLORS[pi]}"
      "so=${COLORS[so]}"
      "bd=${COLORS[bd]}"
      "cd=${COLORS[cd]}"
      "or=${COLORS[or]}"
      "mi=${COLORS[mi]}"
      "ex=${COLORS[ex]}"
      
      # executables
      "*.cmd=${COLORS[ex]}"  # unnecessary
      "*.exe=${COLORS[ex]}"  # dito
      
      # scripts
      "*.sh=${COLORS[script]}"
      "*.mksh=${COLORS[script]}"
      "*.csh=${COLORS[script]}"
      "*.tcsh=${COLORS[script]}"
      "*.bash=${COLORS[script]}"
      "*.zsh=${COLORS[script]}"
      "*.php=${COLORS[script]}"
      "*.cgi=${COLORS[script]}"

      # Office Dokumente
      "*.odb=${COLORS[doc]}" # Datenbank
      "*.odp=${COLORS[doc]}" # Präsentation
      "*.ods=${COLORS[doc]}" # Tabelle
      "*.odt=${COLORS[doc]}" # Text
      "*.ott=${COLORS[doc]}" # Text Vorlage
      "*.doc=${COLORS[doc]}" # Text
      "*.ppt=${COLORS[doc]}" # Präsentation
      "*.xls=${COLORS[doc]}" # Tabelle
      "*.docx=${COLORS[doc]}" # Text
      "*.pptx=${COLORS[doc]}" # Präsentation
      "*.xlsx=${COLORS[doc]}" # Tabelle

      # archives or compressed
      "*.tar=${COLORS[archive]}"
      "*.tgz=${COLORS[archive]}"
      "*.arj=${COLORS[archive]}"
      "*.taz=${COLORS[archive]}"
      "*.lzh=${COLORS[archive]}"
      "*.zip=${COLORS[archive]}"
      "*.z=${COLORS[archive]}"
      "*.Z=${COLORS[archive]}"
      "*.gz=${COLORS[archive]}"
      "*.bz2=${COLORS[archive]}"
      "*.xz=${COLORS[archive]}"
      "*.bz=${COLORS[archive]}"
      "*.tz=${COLORS[archive]}"

      # packet manager files
      "*.rpm=${COLORS[packet]}"
      "*.cpio=${COLORS[packet]}"
      "*.deb=${COLORS[packet]}"

      # java files
      "*.jar=${COLORS[java]}"
      "*.sar=${COLORS[java]}"
      "*.war=${COLORS[java]}"
      "*.rar=${COLORS[java]}"

      # images
      "*.jpg=${COLORS[image]}"
      "*.JPG=${COLORS[image]}"
      "*.jpeg=${COLORS[image]}"
      "*.gif=${COLORS[image]}"
      "*.bmp=${COLORS[image]}"
      "*.pbm=${COLORS[image]}"
      "*.pgm=${COLORS[image]}"
      "*.ppm=${COLORS[image]}"
      "*.xbm=${COLORS[image]}"
      "*.xpm=${COLORS[image]}"
      "*.png=${COLORS[image]}"
      "*.tif=${COLORS[image]}"
      "*.tiff=${COLORS[image]}"
      "*.tga=${COLORS[image]}"
      "*.xcf=${COLORS[image]}"
      "*.eps=${COLORS[image]}"

      # backups
      "*#=${COLORS[backup]}"
      "*%=${COLORS[backup]}"
      "*~=${COLORS[backup]}"
      "*.bkp=${COLORS[backup]}"
      
      # readmes
      "*EADME=${COLORS[readme]}"
      "*eadme=${COLORS[readme]}"

      # source files
      "*.c=${COLORS[source]}"
      "*.C=${COLORS[source]}"
      "*.cc=${COLORS[source]}"
      "*.CC=${COLORS[source]}"
      "*.cp=${COLORS[source]}"
      "*.CP=${COLORS[source]}"
      "*.c++=${COLORS[source]}"
      "*.C++=${COLORS[source]}"
      "*.cpp=${COLORS[source]}"
      "*.CPP=${COLORS[source]}"
      "*.cxx=${COLORS[source]}"
      "*.CXX=${COLORS[source]}"
      "*.java=${COLORS[source]}"
      "*.jsp=${COLORS[source]}"
      "*.scm=${COLORS[source]}"
      "*.pl=${COLORS[source]}"
      "*.pm=${COLORS[source]}"
      "*.py=${COLORS[source]}"
      "*.pyw=${COLORS[source]}"
      "*.rb=${COLORS[source]}"
      "*.m=${COLORS[source]}"
      "*.F=${COLORS[source]}"
      "*.cob=${COLORS[source]}"
      "*.fpp=${COLORS[source]}"
      "*.FPP=${COLORS[source]}"
      "*.r=${COLORS[source]}"
      "*.S=${COLORS[source]}"
      "*.adb=${COLORS[source]}"
      "*.l=${COLORS[source]}"
      "*.y=${COLORS[source]}"
      "*.sql=${COLORS[source]}"
      "*.js=${COLORS[source]}"
      "*.lisp=${COLORS[source]}"
      "*.pas=${COLORS[source]}"
      
      # preprocessed files (or those that should not be preprocessed)
      "*.i=${COLORS[preprocessed]}"
      "*.ii=${COLORS[preprocessed]}"
      "*.mi=${COLORS[preprocessed]}"
      "*.f=${COLORS[preprocessed]}"
      "*.for=${COLORS[preprocessed]}"
      "*.FOR=${COLORS[preprocessed]}"
      "*.s=${COLORS[preprocessed]}"
      
      # object files
      "*.o=${COLORS[object]}"
      "*.class=${COLORS[object]}" # class-dateien
     
      # libraries XXX doesn't work if execute-bit is set (as normally)
      "*.a=${COLORS[library]}"
      "*.so=${COLORS[library]}"
     
      # header files
      "*.h=${COLORS[header]}"
      "*.hh=${COLORS[header]}"
      "*.H=${COLORS[header]}"
      "*.hpp=${COLORS[header]}"
      "*.h++=${COLORS[header]}"
      "*.hxx=${COLORS[header]}"
      "*.ads=${COLORS[header]}" # OK?
      

      # for building
      "*akefile=${COLORS[build]}"
      "*akefile.in=${COLORS[build]}"
      "*onfigure=${COLORS[build]}"
      "*onfigure.in=${COLORS[build]}"

      # markup files # XXX ?
      "*.html=${COLORS[markup]}"
      "*.css=${COLORS[markup]}"
      "*.htm=${COLORS[markup]}"
      "*.HTM=${COLORS[markup]}"
      "*.xml=${COLORS[markup]}"
      "*.properties=${COLORS[markup]}"
      "*.shtml=${COLORS[markup]}"
      "*.xhtml=${COLORS[markup]}"
      "*.nw=${COLORS[markup]}"
      "*.txt=${COLORS[markup]}"
      "*.TXT=${COLORS[markup]}"
      "*.lyx=${COLORS[markup]}"
      "*.mgp=${COLORS[markup]}"

      "*.tex=${COLORS[markup]}"
      "*.sty=${COLORS[markup]}"
      "*.fd=${COLORS[markup]}"
      "*.cls=${COLORS[markup]}"
      "*.def=${COLORS[markup]}"
      "*.cfg=${COLORS[markup]}"
      "*.ltx=${COLORS[markup]}"

      # printable
      "*.ps=${COLORS[printable]}" 
      "*.pdf=${COLORS[printable]}"

      # audio files
      "*.ogg=${COLORS[audio]}"
      "*.flac=${COLORS[audio]}"
      "*.mp3=${COLORS[audio]}"
      "*.wav=${COLORS[audio]}"
      
      # video files
      "*.mpg=${COLORS[video]}"
      "*.MPG=${COLORS[video]}"
      "*.mpeg=${COLORS[video]}"
      "*.MPEG=${COLORS[video]}"
      "*.mov=${COLORS[video]}"
      "*.MOV=${COLORS[video]}"
      "*.avi=${COLORS[video]}"
      "*.AVI=${COLORS[video]}"
      "*.rm=${COLORS[video]}"
      "*.RM=${COLORS[video]}"
      "*.ram=${COLORS[video]}"
      "*.RAM=${COLORS[video]}"
      "*.wmv=${COLORS[video]}"
      "*.WMV=${COLORS[video]}"
      "*.mkv=${COLORS[video]}"
      "*.MKV=${COLORS[video]}"
      "*.ogm=${COLORS[video]}"
      "*.OGM=${COLORS[video]}"

      # diff stuff
      "*.rej=${COLORS[diff]}"
      "*.orig=${COLORS[diff]}"
      "*.diff=${COLORS[diff]}"

  #    ${ls_colors}
  )

  alias ls="ls --color=auto" 
else
  # macOS
  export LSCOLORS="exfxcxdxbxegedabagacad"
  alias ls="ls -G"
fi

# vim:ai sw=2

