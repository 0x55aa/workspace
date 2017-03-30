#!/bin/bash

# Adobe
echo "KILL Adobe"
ps aux|grep -v grep|grep "Adobe"|awk '{print $2}'|xargs kill -9
# 安卓手机文件显示工具
echo "KILL Android File Transfer Agent"
ps aux|grep -v grep|grep "Android File Transfer Agent"|awk '{print $2}'|xargs kill -9
# 建行模块
echo "KILL WDC"
ps aux|grep -v grep|grep "WDC"|awk '{print $2}'|xargs kill -9
ps aux|grep -v grep|grep "CCB"|awk '{print $2}'|xargs kill -9
