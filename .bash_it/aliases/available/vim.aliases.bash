cite 'about-alias'
about-alias 'vim abbreviations'
# if we're on a mac, include more
OS=`uname -s`
if [ "$OS" == "Darwin" ]
  then
  function mvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }
  alias v='mvim'
fi
