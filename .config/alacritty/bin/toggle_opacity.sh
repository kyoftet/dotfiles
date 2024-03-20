#!/bin/zsh

toml_file="$HOME/.config/alacritty/alacritty.toml"

get_opacity() {
    opacity=$(grep 'opacity =' "$toml_file" | awk '{print $3}')
    echo "$opacity"
}

toggle_opacity() {
    current_opacity=$(get_opacity)
    case "$current_opacity" in
        1)
            new_opacity="0.55"
            ;;
        *)
            new_opacity="1"
            ;;
    esac

    sed -i "" "s/opacity = .*/opacity = $new_opacity/" "$toml_file"
}

toggle_opacity
