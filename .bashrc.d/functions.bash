###############################################################################
# A function to open files with xdg-open and discard stout and sterror
function op () {
    xdg-open "$*" &> /dev/null
}
###############################################################################

###############################################################################
# Display man pages in vim with the sim-superman plugin
# Adds syntax highlighting, etc that less doesn't do.
# https://github.com/jez/vim-superman
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
###############################################################################
