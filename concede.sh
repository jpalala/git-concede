#!/bin/bash
## Basic gist is 1. Get the previous commit through git rev-parse , reset it (--mixed by default), stash your working dir, (optionally) clean it, git s
DEFAULT_PREV_NUM=1
# (optional) first lookup your previous commits and find the commit
# git log | tail -n 10
echo "revert to $DEFAULT_PREV_NUM ?"
read -p "Enter your answer (y/n) " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
   echo  "We are now going to stash"  # (optional) move to a new line
   PREV_COMMIT=$(git rev-parse HEAD~$DEFAULT_PREV_NUM)
   git reset $PREV_COMMIT
   # uncomment if you want a clean slate (but keep env files from deletion)
   #git clean -e *.env* -fd 
   T_NOW=$(date +"%H:%M")
   git stash save "stashed back HEAD minus $DEFAULT_PREV_NUM changes at $T_NOW \n\n\n"
else 
  echo "Aborting..."   
fi
# TODO ask user what to do next..
echo "\n\n"
echo "You may now switch branch and pull changes from main then apply your stashed changes"

echo "\"Thank you come again\" -Apu"


