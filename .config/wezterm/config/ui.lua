local ui_conf = {}

function ui_conf.setup(config)
    config.window_background_opacity = 1.0
    config.enable_scroll_bar = false
    config.window_decorations = "RESIZE"
    config.inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 0.90,
    }
    config.window_padding = {
        left = 11,
        right = 11,
        top = 11,
        bottom = 11,
    }
    config.window_background_gradient = {
        orientation = 'Horizontal',
        colors = {
            '#0f0c20',
            '#0f0c25',
            '#000030',
            '#0f0c25',
        },
        interpolation = 'Linear',
        blend = 'Rgb',
    }
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
    config.window_background_opacity = 1.0
end

return ui_conf
