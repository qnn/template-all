#!/bin/bash

LAYOUTS=($(find . -maxdepth 1 -type d | sed 's!.*/!!'))

for LAYOUT in "${LAYOUTS[@]}"
do
	if [ -f "$LAYOUT/_config.yml" ] && ! grep -q "layouts: _layout_$LAYOUT" "$LAYOUT/_config.yml"
	then
		sed -i.bak "s/layouts: _layout_.*/layouts: _layout_$LAYOUT/g" "$LAYOUT/_config.yml"
		rm -f "$LAYOUT/_config.yml.bak"
		echo "$LAYOUT/_config.yml updated."
	fi
done
