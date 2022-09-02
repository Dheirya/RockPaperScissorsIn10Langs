#!/opt/homebrew/bin/bash

declare -A loses_to=(["rock"]="scissors" ["paper"]="rock" ["scissors"]="paper")
computer=""
compwins=0
playerwins=0

function computermove {
  random=$((1 + RANDOM % 3))
  if [[ $random == 1 ]]; then
    computer="rock"
  elif [[ $random == 2 ]]; then
    computer="paper"
  else
    computer="scissors"
  fi
}

play() {
  if [[ $1 != "" ]]; then
    printf "$1"
    if [ ${#1} -gt 28 ]; then
      printf "Score: $playerwins player wins to $compwins computer wins\n...\n"
    fi
  fi
  computermove
  read -r -p "Rock, Paper, or Scissors? " input
  player=${input,,}
  if [[ -z ${loses_to[${player}]} ]]; then
    play "...\nNot a valid move\n...\n"
  else
    if [[ ${player} == "${computer}" ]]; then
      play "...\nIt's a tie!\n...\n"
    else
      if [[ ${player} == "${loses_to[${computer}]}" ]]; then
        ((compwins += 1))
        play "...\nYou lost... ${player^} loses to ${computer^}\n"
      else
        ((playerwins += 1))
        play "...\nYou won! ${player^} beats ${computer^}\n"
      fi
    fi
  fi
}

play ""
