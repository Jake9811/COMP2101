#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

# This script generates three reports that displays specific files in the system

# First part generates a list of files that have setuid bit permission turned on,they are displayed as a list
# sorted by name of the owner and the errors are redirected to /dev/null
# find cmd is used to query all the -type f (regular files)
# -executable is used to execute -perm cmd and filter files with "4000" format permission i.e. setuid bit
# -ls is used to diaply as a list
# 2> is used to redirect errors to /dev/null
# sort is used to sort the list according to the 3rd field i.e. owner of file

# Second part generates another list of files that have setgid bit permission turned on, they are also
# displayed as a list, sorted by name of the primary group and the errors are redirected to /dev/null
# find cmd is used to query all the -type f (regular files)
# -executable is used to execute -perm cmd and filter files with "2000" format permission i.e. setgid bit
# -ls is used to display as a list
# 2> is used to redirect errors to /dev/null
# sort is used to sort the list according to the 6th field i.e. group name

# Last part generates a list of 10 largest files in the system and sorted by their size with largest first.
# It only displays file size  and path
# find cmd is used to query all the -type f (regular files)
# -exec is used to execute -B cmd and filter just the files sizes in MBytes on every line
# 2> is used to redirect errors to /dev/null
# sort is used to sort by the file size i.e. first field and in reverse order (-r)
# finally head is used to display only first 10 entries/files

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""
echo "Setgid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 6
echo ""
echo "10 largest regular files:"
echo "============="
find / -type f -exec du -B M {} + 2>/dev/null | sort -n -r | head
