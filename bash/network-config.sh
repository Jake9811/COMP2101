#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

# Custom Comments
# This script displays the network configuration of the machine
# It shows the hostname, LAN address and hostname, External address and name & Router address and name
# It looks up this info through ip configs, /etc/hosts file, route table and using external website with curl.
# All the information is dynamically created hence will differ on each machine

# Variables
hostname=$(hostname)
interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
lan_address=$(ip a s $interface_name|awk '/inet /{gsub(/\/.*/,"");print $2}')
lan_hostname=$(getent hosts $lan_address | awk '{print $2}')
ext_ip=$(curl -s icanhazip.com)
ext_name=$(getent hosts $ext_ip | awk '{print $2}')
router_address=$(ip r s default| cut -d ' ' -f 3)
router_name=$(getent hosts $router_address | awk '{print $2}')

cat <<EOF
Hostname        : $hostname
LAN Address     : $lan_address
LAN Hostname    : $lan_hostname
External IP     : $ext_ip
External Name   : $ext_name
Router Address  : $router_address
Router Hostname : $router_name
EOF
