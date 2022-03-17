#!/bin/sh

# Program header
# Title: Create subaccount(s)
# Developer: I542932 j.klingelhoefer@sap.com
#
# Version history:
# 17th Mar 2022  Initial version

read -t 3 -p  $'Be sure to have logged in via ./btp login command...\n'

btp assign security/role-collection "Subaccount Administrator" \
--to-user jens.klingelhoefer@web.de --create-user-if-missing --subaccount "da83ff3d-a656-4943-8614-1e1a6c64cf6b" 
