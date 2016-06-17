###############################################################################
# A function to open files with xdg-open and discard stout and sterror
function op () {
    xdg-open "$*" &> /dev/null
}
###############################################################################
