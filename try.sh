#!/bin/bash
# $(date +"%d/%b/%Y:%H")
#replace below time with commented out date

#Validate file name
if [ $# -ne 1 ]
then
  echo "please specify a file"
  exit 0
fi

#set variables
time="18/May/2015:20"
logfile=$1

errorLogs=$(awk -v date="$time" '($4 ~ date && $9 ~ /[4-5][0-9][0-9]/)' $logfile)

if [ $(echo $errorLogs|  wc -l) -gt 100 ]
then
   body=$( echo $errorLogs | awk '{print $9,$7}' | uniq -c | sort -r)	
   echo "send email" && echo $body
fi
