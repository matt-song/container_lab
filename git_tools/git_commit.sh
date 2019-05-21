#!/bin/bash

msg=$1;
[ x"$msg" != x ] && msg+=","
DATE_NOW=`date +%F`

cd /root/container_lab
git add --all
git commit -m "$msg Updated at $DATE_NOW"
git push -u origin master

