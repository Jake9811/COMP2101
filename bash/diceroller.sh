#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one
# Ans: This script rolls a random dice 7 times which is equal to the number of letters in my first name (RISHABH)
# I went with the simplest approach since

# roll the dice and display the result
echo "
Rolling...
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
$(( RANDOM % 6 + 1)) rolled
"
