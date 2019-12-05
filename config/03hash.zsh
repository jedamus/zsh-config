proj=$HOME/Projekte

hash -d            log=/var/log
# modifiziert Donnerstag, 05. Dezember 2019 23:31 von Leander Jedamus
# modifiziert Mittwoch, 20. November 2019 12:38 von Leander Jedamus
# modifiziert Dienstag, 12. November 2019 11:39 von Leander Jedamus
hash -d              d=/usr/share/doc

if [ $machtype = "MacOS" ]; then
  doc=$HOME/Documents
  hash -d          latex=$doc/latex
  hash -d        rezepte=$doc/latex/rezepte
  hash -d            tex=$doc/tex
  hash -d          noweb=$doc/noweb
  hash -d           Word=$doc/Word
  hash -d          Excel=$doc/Excel
  hash -d            rom=$doc/pdf/rom
  hash -d     Rechnungen=$doc/pdf/Rechnungen
  hash -d        buecher=$doc/pdf/Bücher
  hash -d        eclipse=$doc/workspace
  hash -d android_studio=$doc/AndroidStudioProjects
else
  hash -d           www=/var/www
fi

hash -d        qpython=$proj/qpython
hash -d         python=$proj/python
hash -d           make=$proj/make
hash -d           perl=$proj/perl
hash -d        fortran=$proj/fortran
hash -d          cobol=$proj/cobol
hash -d           ruby=$proj/ruby
hash -d              c=$proj/c
hash -d       automake=$proj/automake
hash -d             deb=$proj/deb

if [ $machtype = "MacOS" ]; then
  hash -d            fas="$HOME/Library/Scripts/Folder Action Scripts"
  hash -d             te=$proj/TextExpander
  unset doc
fi

unset proj

# einfach ~python eingeben und die Shell wechselt in das entsprechende Verzeichnis
setopt autocd
