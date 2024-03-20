local ui_conf = {}

function ui_conf.setup(config)
    config.window_background_opacity = 1.0
    config.command_palette_bg_color = "#00001d"
    config.command_palette_fg_color = "#008888"
    config.command_palette_rows = 24
    config.enable_scroll_bar = false
    config.font_size = 11.5
    config.inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.5,
        brightness = 0.3,
    }
    config.integrated_title_button_alignment = "Right"
    config.window_background_gradient = {
        colors = {
            "#000a33",
            "#000037",
            "#000a3b",
            "#00003f",
            "#000043",
            "#00003f",
            "#000a33",
            "#000037",
            "#000a3b",
        },
        orientation = { Linear = { angle = -45.0 } },
    }
    config.window_background_opacity = 1.0
    config.window_decorations = "RESIZE"
    config.window_frame = {
        inactive_titlebar_bg = 'rgba(0,0,0,0)',
        active_titlebar_bg = 'rgba(0,0,0,0)',
        border_left_width = '0.5cell',
        border_right_width = '0.5cell',
        border_bottom_height = '0.25cell',
        border_top_height = '0.25cell',
        border_left_color = '#008080',
        border_right_color = '#008080',
        border_bottom_color = '#008080',
        border_top_color = '#008080',
    }
    config.window_padding = {
        left = 11,
        right = 11,
        top = 11,
        bottom = 11,
    }
end

return ui_conf
