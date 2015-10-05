#!/bin/bash
source ~/dotfiles/colors.sh
UTF_DOT='\xE2\x80\xa2'
JRNL_FILE=""

function remove_empty_lines() {
  without_empty_lines=$(echo "$1" | grep -v -E '^[[:space:]]*$')
  echo "$without_empty_lines"
}

function colorize_code_bloc() {
  colorized=$(echo "$1" | perl -pe 's/\`(.*?)\`/'${ITALIC}${ORANGE}'$1'${NO_COLOR}'/g' )
  echo $colorized
}

function colorize_date_bloc() {
  colorized=$(echo "$1" | perl -pe 's/(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2})/'${BG_LIGHT_YELLOW}${BLACK}'$1'${NO_COLOR}${LIGHT_YELLOW}''${NO_COLOR}'/g' )
  echo $colorized
}

function colorize_bold_bloc() {
  colorized=$(echo "$1" | perl -pe 's/__(.*?)__/'${RED}${BOLD}'$1'$NO_COLOR'/g' )
  echo $colorized
}

function colorize_italic_bloc() {
  colorized=$(echo "$1" | perl -pe 's/_(.*?)_/'${ITALIC}${GREEN}'$1'${NO_COLOR}'/g' )
  echo $colorized
}

function colorize_name_bloc() {
  colorized=$(echo "$1" | perl -pe 's/#(\S*)\b/'${MAGENTA}'$1'${NO_COLOR}'/g' )
  echo $colorized
}

function change_puce() {
  colorized=$(echo "$1" |perl -pe 's/^\*\s/'${UTF_DOT}' /g'| perl -pe 's/@(\S*)\b/'$UNDERLINE'$1'${NO_COLOR}'/g' )
  echo $colorized
}

function jrnl_filter() {
  if [[ -z "$@" ]]; then
    param="-10"
  else
    param="$@"
  fi
  echo "-------------------------------------------------------"
  jrnl_list=$(jrnl $JRNL_FILE "$param")
  without_empty_lines="$(remove_empty_lines "$jrnl_list")"
  colorize_code="$(colorize_code_bloc "$without_empty_lines")"
  colorize_date="$(colorize_date_bloc "$colorize_code")"
  with_bold="$(colorize_bold_bloc "$colorize_date")"
  with_italic="$(colorize_italic_bloc "$with_bold")"
  colorize_name="$(colorize_name_bloc "$with_italic")"
  change_puce="$(change_puce "$colorize_name")"
  echo "$change_puce"
  echo "-------------------------------------------------------"
}


function jrnl_edit() {
  jrnl $JRNL_FILE "$@" --edit
}


alias jl="JRNL_FILE=\"\";jrnl_filter"
alias jel="JRNL_FILE=\"\";je -1" #edité la dernière entrée du journal
alias jle=jel # faute de frappe
alias je="JRNL_FILE=\"\";jrnl_edit"

alias wl="JRNL_FILE=\"work\";jrnl_filter"
alias wy="JRNL_FILE=\"work\";wl -from yesterday -until yesterday" # les entrées de la veille
alias wt="JRNL_FILE=\"work\";wl -from today -until today" # les entrées du jour
alias wel="JRNL_FILE=\"work\";we -1" #edité la dernière entrée du journal
alias we="JRNL_FILE=\"work\";jrnl_edit"
alias wifi="wl @wifi"

function jrnl_now {
  jrnl $JRNL_FILE today at $(date +"%H:%M"): $@ 
  if [[ -z $JRNL_FILE ]] then
    jl -1
  else 
    wl -1
  fi
}
alias j="JRNL_FILE=\"\";jrnl_now"
alias w="JRNL_FILE=\"work\";jrnl_now"

function jrnl_qc() {
  qc=$1
  text=$2
  w @qc @$qc "$text"
}
alias qc="jrnl_qc"
