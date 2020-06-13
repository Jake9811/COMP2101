#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

# Custom Comments
# This Script Runs after login and Welcomes the visitor to the planet of the host who's personalities changes based on the day of the weekday
# It also tells the day of the week with current time in HH:MM AM/PM format
# The Display is in cowsay format with a digital figlet font face

###############
# Variables   #
###############
hostname="$(hostname)"
day="$(date +%A)"
HH="$(date +%I)"
MM="$(date +%M)"
AM_PM="$(date +%p)"
# If test statements to apply title based on the day of the week
if [ "$day" = "Sunday" ]; then
  title="God of Sun"
elif [ "$day" = "Monday" ]; then
  title="God of Moon"
elif [ "$day" = "Tuesday" ]; then
  title="God of War"
elif [ "$day" = "Wednesday" ]; then
  title="All Father"
elif [ "$day" = "Thursday" ]; then
  title="God of Thunder"
elif [ "$day" = "Friday" ]; then
  title="God of Love"
else
  title="Devil"
fi

###############
# Main        #
###############
message="
Welcome to planet $hostname,

 \"$title - $USER!\"

It is $day at $HH:$MM $AM_PM.

"
# Displaying the welcome message with figlet and cowsay
figlet -t -f digital "$message" | cowsay -n
