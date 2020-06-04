#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#
# Ans: This script rolls a pair of dice with 6 sides and displays the rolls, sum of the rolls and average of the rolls.
# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias
#storing number of sides in a variable range
range=6
#storing minimum value of generated number in a variable bias
bias=1

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % $range + $bias))
die2=$(( RANDOM % $range + $bias))
# display the results with sum and average
echo "Rolled $die1, $die2"
echo "Sum is $(($die1 + $die2))"
echo "Average is $(( ($die1 + $die2) / 2 ))"
