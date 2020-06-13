#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

# Custom Comments
# This script gives the user 5 tries to guess the password which is "password"
# After 5 Incorrect guess, user fails
# At any Correct Guess program ends
# It uses read cmd to get input from the user and nested ifs to simulate a loop like condition

# Main
# Propmting the user to guess and storing the input in TestString variable
read -p "Guess the password (5 tries remain): " TestString
referenceString="password"

# Starting the nested ifs to compare user input with referenceString or "password"
# On Correct input - exit if
# On Incorrect input - ask again for 5 times
if [ "$TestString" = $referenceString ]; then
  echo "Correct!"
else
  echo "Incorrect. (4 tries remain)"
  read -p "Guess the password: " TestString
  if [ "$TestString" = $referenceString ]; then
    echo "Correct!"
  else
    echo "Incorrect. (3 tries remain)"
    read -p "Guess the password: " TestString
    if [ "$TestString" = $referenceString ]; then
      echo "Correct!"
    else
      echo "Incorrect. (2 tries remain)"
      read -p "Guess the password: " TestString
      if [ "$TestString" = $referenceString ]; then
        echo "Correct!"
      else
        echo "Incorrect. (1 try remain)"
        read -p "Guess the password: " TestString
        if [ "$TestString" = $referenceString ]; then
          echo "Correct!"
        else
          echo "Incorrect. (Failure)"
        fi
      fi
    fi
  fi
fi
