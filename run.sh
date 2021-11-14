#!/bin/bash
workdir=$(cd $(dirname $0); pwd)
last=`head $workdir/current`
this=`curl -s -X GET "https://ip.cn/api/index?ip=&type=0" |jq -r '.ip'`
if [ "$last" != "$this" ];then
    echo "$this" > $workdir/current
fi
