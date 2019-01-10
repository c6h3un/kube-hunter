#!/bin/sh
CIDR=$1
PARSE_STR=${2:-"No vulnerabilities"}
#echo $PARSE_STR

python kube-hunter.py --cidr $CIDR &> _output
cat _output
cat _output |grep "$PARSE_STR" > /dev/null
#python kube-hunter.py --cidr $CIDR 2>&1 |grep "$PARSE_STR" > /dev/null 
if [ $? == 0 ]
then
  echo "SUCCESS"
  exit 0;
else
  echo "FAILED"
  exit 1;
fi
