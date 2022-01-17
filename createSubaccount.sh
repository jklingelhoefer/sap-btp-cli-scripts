#!/bin/sh

# Program header
# Title: Create subaccount(s)
# Developer: I542932 j.klingelhoefer@sap.com
#
# Version history:
# 17th Jan 2022  Initial version

GLOBAL_ACCOUNT_SUBDOMAIN="4fc4946ctrial"
SUBACCOUNT="cf-dev"
SUBACCOUNT_DISPLAY_NAME="CF dev"
REGION="eu10"
DESCRIPTION="CloudFoundry Development"

read -t 3 -p  $'Be sure to have logged in via ./btp login command...\n'

./btp create accounts/subaccount \
--display-name "$SUBACCOUNT_DISPLAY_NAME" \
--region $REGION \
--subdomain "${GLOBAL_ACCOUNT_SUBDOMAIN}-${SUBACCOUNT}" \
--description "$DESCRIPTION" \
--labels "{\"Department\": [\"SAP_Basis\"],\"Contacts\": [\"name1@example.com\",\"name2@example.com\"],\"Manager\":[\"Michael_Manager\"]}"
