#!/bin/bash
msg=$1;
[ x"$msg" == x ] && msg+="no comment, general update"
DATE_NOW=`date +%F`

cd /root/container_lab
git add *
git commit -a -m "Updated at $DATE_NOW, comments: [$msg]"
git push -u origin master
