#!/bin/sh

# Program header
# Title: Create subaccount(s)
# Developer: I542932 j.klingelhoefer@sap.com
#
# Version history:
# 17th Jan 2022  Initial version

GLOBAL_ACCOUNT_SUBDOMAIN="4fc4946ctrial"
SUBACCOUNT="SMA-Spielwiese"
SUBACCOUNT_DISPLAY_NAME="SMA-Spielwiese"
REGION="eu10"
DESCRIPTION="SMA-btp-CLI-Spielwiese"

read -t 3 -p  $'Be sure to have logged in via ./btp login command...\n'

btp create accounts/subaccount \
--display-name "$SUBACCOUNT_DISPLAY_NAME" \
--region $REGION \
--subdomain "${GLOBAL_ACCOUNT_SUBDOMAIN}-${SUBACCOUNT}" \
--description "$DESCRIPTION" \
--labels "{\"Department\": [\"SAP_Basis\"],\"Contacts\": [\"name1@example.com\",\"name2@example.com\"],\"Manager\":[\"Michael_Manager\"]}" \
--custom-properties "$(printf '[{"key": "Contact Person", "value": "%s"}, {"key": "Department", "value": "%s"}]' "Kontaktperson Jens" "Abt. Customer Success Advisory")"
