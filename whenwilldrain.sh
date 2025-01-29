#!/usr/bin/env bash

printhelp() {
   echo "Usage:  $0 <nodelist>"
}


if [[ $# -ne 1 ]]; then
   echo "Error: argument required"
   printhelp
   exit 1
fi
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
   printhelp
   exit 0
fi

sinfo --nodes="$1"
echo ""
squeue --Format="JOBID:8,UserName:14 ,Account:16 ,StateCompact:3,TimeLeft:.11 ,NumNodes:.5 ,EndTime,NodeList:" --sort="+e,j" --nodelist="$1"
