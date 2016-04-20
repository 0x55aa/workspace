#!/bin/bash

if [ "$1" ]
  then
  curl -w "@curl-format.txt" -o /dev/null -s $1

else
  echo '\n ./curl.sh "http://baidu.com/"\n\n'

fi
