#!/bin/bash
# This script demonstrates how the shift command works

# Custom Comments
# This script takes command line arguments
# It has some predefined arguments like -h, -v, -d N
# -h option can be used to display help for the command
# -v option can be used to turn on verbose mode
# -d N option can be used to turn on degub mode with debug level N
# Any non recognized arguments are stored for later processing
# After processing all arguments it displays the active settings for verbose and debug
# It also displays the list of un-recognized arguments

# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # process the arguments in case
  case "$1" in
    # for -h option display help for the command
    -h )
        echo "Usage: $(basename $0) [-h] [-v] [-d N]"
        exit
        ;;
    # for -v option set verbose var value "ON"
    -v )
        verbose="ON"
        ;;
    # for -d option, check for N i.e. $2. If available, set debug_lvl var. If not, display an error.
    -d )
        if [[ $2 =~ ^[1-9]$ ]]; then
          debug_lvl="$2"
          shift
        else
          echo "ERROR: debug level N not given or not a single digit, after -d option."
          exit
        fi
        ;;
    # for everything else, put into myargs array
    * )
        # add whatever is in $1 to the myargs array
        myargs+=("$1")
        # tell the user what we did
        echo "Added \'$1\' to the arguments array"
  esac

# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
#          Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
#          If the help option is recognized, print out help for the command and exit
#          If the verbose option is recognized, set a variable to indicate verbose mode is on
#          If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
#             display an error if the user gave the -d option without a single digit number after it
#          Anything that wasn't recognized on the command line should still go into the myargs array

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label

# Displaying the settings and myargs contents
echo "--------------------------"
echo "Settings"
[ ! -z "$verbose" ] && echo "1. Verbose Mode = $verbose" || echo "1. Verbose Mode = OFF"
[ ! -z "$debug_lvl" ] && echo "2. Debug Mode = ON, level = $debug_lvl" || echo "2. Debug Mode = OFF"
echo "--------------------------"
echo "List of un-recognized arguments"
for (( i = 0; i < ${#myargs[@]}; i++ )); do
  echo "$(($i + 1)). ${myargs[$i]}"
done
