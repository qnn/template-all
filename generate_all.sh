#!/bin/bash
set -e
SITES=($(find "`pwd`" -type d -maxdepth 1))
JEKYLL=$(which jekyll)

for SITE in "${SITES[@]}"
do
	if [ -f "$SITE/_config.yml" ]
	then
		cd $SITE
		$JEKYLL build
	fi
done
