#!/bin/bash

WATCH_DIR="."
EXCLUDE="\.less$"
inotifywait -rme modify --format '%f' --exclude $EXCLUDE $WATCH_DIR | while read line; do
	# echo $line
	# echo ${line%.*}
	# echo ${line##*.}
	echo "reload" | nc localhost 32000;
done