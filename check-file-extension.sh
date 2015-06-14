#!/usr/bin/env bash
me=`basename "$0"`
for file in *; do
	if [[ "$file" == "$me" ]]; then
		continue
	fi
	if [ -f "$file" ]; then
		ext="${file##*.}"
		name="${file%.*}"
		file -ib $file | sed 's/msvideo/avi/' | sed 's/matroska/mkv/' | grep -q $ext || echo $(file -i $file)
	fi
done
