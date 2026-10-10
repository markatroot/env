#!/bin/bash

path=$1
filename=$(basename $path)
next_file=$(find /home/mark/Coding/Projects/navi/src/Web/CyberMetrics.FaciliWorks.NetCore.Next -type f -name $filename -print -quit)

nvim -d $path $next_file

