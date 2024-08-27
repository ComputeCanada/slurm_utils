#!/usr/bin/env bash

printhelp() {
   echo "Usage:  $0 <nodelist>"
}


if [[ $# -ne 1 ]]; then
   echo "Error: argument required"
   echo $#
   printhelp
   exit 1
fi
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
   printhelp
   exit 0
fi

sinfo --nodes="$1"
echo ""
squeue --Format="JOBID,UserName,State,TimeLeft,NodeList,EndTime"  --sort="+e,j" --nodelist="$1"

