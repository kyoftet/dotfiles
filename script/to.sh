#!/bin/zsh

## alacritty.yml does not exist, raise an alert
[[ ! -f $ALACRITTY_PATH/alacritty.yml ]] && \
	echo "alacritty.yml does not exist" && exit 0

## Fetch opacity from alacritty.yml
opacity=$(awk '$1 == "opacity:" {print $2; exit}' \
	$ALACRITTY_PATH/alacritty.yml)

## Assign toggle opacity value
case $opacity in 1)
		toggle_opacity=0.55
		;;
	*)
		toggle_opacity=1
		;;
esac

## Replace opacity value in alacritty.yml
sed -i "" "s/opacity: $opacity/opacity: $toggle_opacity/g" \
	$ALACRITTY_PATH/alacritty.yml

