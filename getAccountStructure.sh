#!/bin/sh

# Program header
# Title: Get account structure
# Developer: I542932 j.klingelhoefer@sap.com
#
# Version history:
# 20th Jan 2022  Initial version

GLOBAL_ACCOUNT_SUBDOMAIN="4fc4946ctrial-ga"
temp_dir=$(mktemp -d)

read -t 3 -p $'Be sure to have logged in...\n'

btp list accounts/subaccount > $temp_dir/subaccounts.txt

cat $temp_dir/subaccounts.txt | cut -d ' ' -f 1 > $temp_dir/subaccount_ids.txt

while read id; do
  echo "$id"
  btp get accounts/subaccount "$id" > "$temp_dir/subaccount_$id.txt"
done<$temp_dir/subaccount_ids.txt
