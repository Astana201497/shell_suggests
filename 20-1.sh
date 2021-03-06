#!/bin/sh
[ -z "$1" ] && echo "введите имя директории" && exit
[ ! -d "$1" ] && echo "$1 не является директорией" && exit

DIR=$1

MAXLINKS=`find $DIR -maxdepth 1 -type f -ls | awk '{print $4}' | sort -n | tail -1`
FILES=`find . -maxdepth 1 -type f -ls | awk '{print $4, $11}' | sort -n | grep "^$MAXLINKS " | awk '{print $2}'`

echo $FILES
rm -rf $FILES

find $DIR -maxdepth 1 -type d -depth -empty -print -delete
