#!/bin/bash
date=`date "+%A %d %B"`
time=`date "+%H:%M:%S"`
dunstify -u normal "$time" "$date"
exit 0
