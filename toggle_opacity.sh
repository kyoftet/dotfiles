#!/bin/zsh
 
## alacritty.yml does not exist, raise an alert
[[ ! -f $WINDOWS_ALACRITTY_PATH/alacritty/alacritty.yml ]] && \
	notify-send "alacritty.yml does not exist" && exit 0

## Fetch opacity from alacritty.yml
opacity=$(awk '$1 == "opacity:" {print $2; exit}' \
	$WINDOWS_ALACRITTY_PATH/alacritty/alacritty.yml)

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
	$WINDOWS_ALACRITTY_PATH/alacritty/alacritty.yml
