#!/bin/bash
cd $(dirname $0)
last=`head current`
this=`curl -s -X GET "https://ip.cn/api/index?ip=&type=0" |jq -r '.ip'`
if [ "$last" != "$this" ];then
    echo "$this" > current
    git add current
    git commit -m "modify current ip address"
    git push origin
    
fi
