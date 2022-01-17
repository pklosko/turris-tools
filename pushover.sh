#!/bin/bash

SYS1=`/bin/cat /proc/sys/kernel/hostname`
CURL="/usr/bin/curl"
DATE="/bin/date"

if [ -z "$1" ]; then
  exit;
else
  MSG=$1
  CURRDATE=`$DATE`

#echo "$SUBJ - $MSG"
#exit

  TOKEN="YOUR_TOKEN";
  KEY="YOUR_KEY";

  $CURL -s --form-string "token=$TOKEN" \
    --form-string "user=$KEY" \
    --form-string "title=$SYS1" \
    --form-string "message=$MSG

[$CURRDATE]" \
    --form-string "sound=siren" \
    --form-string "priority=1" \
    https://api.pushover.net/1/messages.json > /dev/null 2>&1
fi
