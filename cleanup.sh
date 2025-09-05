#!/bin/bash

# Exit if .gitignore does not exist
if [ ! -f .gitignore ]; then
	echo ".gitignore not found!"
	exit 1
fi

# Read each line in .gitignore and remove the entry
while IFS= read -r pattern || [ -n "$pattern" ]; do
	# Skip comments and empty lines
	[[ "$pattern" =~ ^#.*$ || -z "$pattern" ]] && continue
	echo "rm -rf -- $pattern"
	rm -rf -- $pattern 2>/dev/null || true
done < .gitignore

rm -rf .ksp
