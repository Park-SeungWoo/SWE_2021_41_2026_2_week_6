#!/bin/bash

for folder in */; do
	folder=${folder%/}
	if [ "$folder" == "files" ]; then
		continue
	fi
	
	upper=$(echo "$folder" | tr 'a-z' 'A-Z')
	
	for file in ./files/*.txt; do
		filename=$(basename "$file")
		if [[ "$filename" =~ ^[$folder$upper] ]]; then
			mv "$file" "./$folder/"
		fi
	done
done
