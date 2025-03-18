local ui_conf = {}

function ui_conf.setup(config)
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
            "#000015",
        },
    }
    config.window_background_opacity = 0.81
    config.macos_window_background_blur = 15
    config.window_decorations = "NONE"
    config.window_frame = {
        inactive_titlebar_bg = 'none',
        active_titlebar_bg = 'none',
        border_left_width = '1cell',
        border_right_width = '1cell',
    }
    config.window_padding = {
        left = 23,
        right = 23,
        top = 23,
        bottom = 23,
    }
end

return ui_conf
