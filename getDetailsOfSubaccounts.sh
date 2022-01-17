#!/bin/sh

# Program header
# Title: Get details of subaccounts below specific directory
# Developer: I542932 j.klingelhoefer@sap.com
#
# Version history:
# 17th Jan 2022  Initial version

PARENT_DIRECTORY="5c2e416a-9365-4b67-8c38-0875866ed905"

read -t 3 -p $'Be sure to have logged in...\n'

if [ -z "$1" ]
  then
    echo "No directory supplied - go for $PARENT_DIRECTORY"
  else
    $PARENT_DIRECTORY=$1
fi

./btp list accounts/subaccount | grep $PARENT_DIRECTORY > subaccounts.txt

cat subaccounts.txt | cut -d ' ' -f 1 > subaccount_ids.txt

while read id; do
  echo "$id"
./btp get accounts/subaccount "$id" 
done<subaccount_ids.txt
