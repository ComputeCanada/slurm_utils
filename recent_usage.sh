#!/bin/env bash

# Author: Maxime Boissonneault

ACCT=${1?Missing account name : e.g. `rrg-pi`}
DAYS=${2:-14}
DATE=$(date +%Y-%m-%d --date="$DAYS day ago")

RES_CPU=$(sacct -A ${ACCT}_cpu  -aX -S $DATE --format=AllocTRES%100,ElapsedRaw | grep billing | sed -e "s/.*billing=\([0-9]*\)/\1/g" | awk 'BEGIN { SUM=0 } { SUM += $1*$2 } END { print SUM/(3600*24*'$DAYS') }')
RES_GPU=$(sacct -A ${ACCT}_gpu  -aX -S $DATE --format=AllocTRES%100,ElapsedRaw | grep billing | sed -e "s/.*billing=\([0-9]*\)[^ ]*/\1/g" | awk 'BEGIN { SUM=0 } { SUM += $1*$2 } END { print SUM/(3600*24*'$DAYS') }')

echo "In the past $DAYS days, project $ACCT has used on average $RES_CPU cores and $RES_GPU GPUs"
