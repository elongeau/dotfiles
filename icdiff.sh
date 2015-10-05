function diff_less() {
  icdiff $1 $2 | less
}
alias diff="diff_less"
