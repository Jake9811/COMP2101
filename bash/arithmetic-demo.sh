#!/bin/bash
#
# this script demonstrates doing arithmetic
#
# Ans: This scripts prompts the user to enter 3 numbers which are then stored into 3 variables
# The sum and product of these 3 numbers are calculated and displayed to the user 
#
# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

# prompting the user to enter 3 numbers
prompt="Enter three numbers: "
# storing the 3 numbers into 3 variables
read -p "$prompt" firstnum secondnum thirdnum
# calculating the sum and product of these 3 numbers
sum=$((firstnum + secondnum + thirdnum))
product=$((firstnum * secondnum * thirdnum))

cat <<EOF
$firstnum plus $secondnum plus $thirdnum is $sum
$firstnum multiplied by $secondnum multiplied by $thirdnum is $product
EOF
