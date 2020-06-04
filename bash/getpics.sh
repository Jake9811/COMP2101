#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it does some error testing
# it summarizes the Pictures directory when it is done
#

# Ans: This script downloads a tar file and a zip file from two sources if they are not present already
# It unpacks both the file and stores them in the ~/Pictures/ directory
# It also checks if ~/Pictures/ directory exists, if not then creates the direcctory.
# Finally it summarizes the ~/Pictures/ directory, displays no of files in this  directory and amount of space this direcctory uses.

# Task 1: Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing that is already in the script to only download the tarfile if you don't already have it and  to make sure the download and extraction commands work, then delete the local copy of the tarfile if the extraction was successful

# make a Pictures directory if we don't have one - assumes we have a home directory
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

#download a tarfile of pictures to our Pictures directory if it isn't already there - assusmes we are online
test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz https://zonzorp.net/pics.tgz

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
test -f ~/Pictures/pics.zip && unzip -d ~/Pictures -o -q ~/Pictures/pics.zip && rm ~/Pictures/pics.zip

# unpack the downloaded tarfile if it is there, then delete the local copy of the tarfile
test -f ~/Pictures/pics.tgz && tar -xC ~/Pictures -f ~/Pictures/pics.tgz && rm ~/Pictures/pics.tgz

# Make a report on what we have in the Pictures directory
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF
