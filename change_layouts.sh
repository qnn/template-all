#!/bin/sh

LAYOUTS=($(find . -maxdepth 1 -type d \( ! -iname ".*" \) -exec basename \{} \;))

for LAYOUT in "${LAYOUTS[@]}"
do
	if [ -f "$LAYOUT/_config.yml" ] && ! grep -q "layouts: _layout_$LAYOUT" "$LAYOUT/_config.yml"
	then
		sed -i "" "s/layouts: _layout_.*/layouts: _layout_$LAYOUT/g" "$LAYOUT/_config.yml"
		echo "$LAYOUT/_config.yml updated."
	fi
done
