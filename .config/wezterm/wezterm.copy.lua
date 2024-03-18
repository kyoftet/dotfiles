local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

--------------------
-- toggle opacity --
--------------------
wezterm.on('toggle_opacity', function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity == 1 then
        overrides.window_background_opacity = 0.55
    else
        overrides.window_background_opacity = 1
    end
    window:set_config_overrides(overrides)
end)

------------
-- window --
------------
wezterm.on('format-window-title', function(tab)
    return string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
end)
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

---------
-- tab --
---------
wezterm.on('format-tab-title', function(tab, _, _, _, _, _)
    local SYMBOL_COLOR = { '#00ffff', '#a4a4a4' }
    local FONT_COLOR = { '#dddddd', '#888888' }
    local index = tab.is_active and 1 or 2
    return {
        { Foreground = { Color = SYMBOL_COLOR[index] } },
        { Text = ' ' },
        { Foreground = { Color = FONT_COLOR[index] } },
        { Text = tab.active_pane.title },
    }
end)

-----------------
-- status line --
-----------------
wezterm.on('update-right-status', function(window, pane)
    local uri = pane:get_current_working_dir()
    local hostname = ''
    if uri then
        hostname = uri.host or wezterm.hostname()

        local dot = hostname:find '[.]'
        if dot then
            hostname = hostname:sub(1, dot - 1)
        end
        if hostname == '' then
            hostname = wezterm.hostname()
        end
    end

    local date = wezterm.strftime '%a %b %-d %H:%M'

    local battey = {}
    for _, b in ipairs(wezterm.battery_info()) do
        table.insert(battey, string.format('%.0f%% ', b.state_of_charge * 100))
    end

    window:set_right_status(wezterm.format {
        { Background = { Color = 'rgba(0,0,0,0)' } },
        { Foreground = { Color = '#2a2a2a' } },
        { Text = '  ' },
        { Background = { Color = '#2a2a2a' } },
        { Foreground = { Color = '#00ffff' } },
        { Text = '󰟒  ' },
        { Background = { Color = '#2a2a2a' } },
        { Foreground = { Color = '#aaaaaa' } },
        { Text = uri.file_path },
        { Background = { Color = '#2a2a2a' } },
        { Foreground = { Color = '#1f1f1f' } },
        { Text = '  ' },
        { Background = { Color = '#1f1f1f' } },
        { Foreground = { Color = '#00ffff' } },
        { Text = '  ' },
        { Background = { Color = '#1f1f1f' } },
        { Foreground = { Color = '#aaaaaa' } },
        { Text = hostname },
        { Background = { Color = '#1f1f1f' } },
        { Foreground = { Color = '#151515' } },
        { Text = '  ' },
        { Background = { Color = '#151515' } },
        { Foreground = { Color = '#00ffff' } },
        { Text = '  ' },
        { Background = { Color = '#151515' } },
        { Foreground = { Color = '#aaaaaa' } },
        { Text = date },
        { Background = { Color = '#151515' } },
        { Foreground = { Color = '#0a0a0a' } },
        { Text = '  ' },
        { Background = { Color = '#0a0a0a' } },
        { Foreground = { Color = '#00ff00' } },
        { Text = '  ' },
        { Background = { Color = '#0a0a0a' } },
        { Foreground = { Color = '#aaaaaa' } },
        { Text = table.concat(battey) },
    })
end)

config.tab_bar_at_bottom = true
config.font_size = 11
config.window_background_opacity = 1
config.colors = {
    foreground = '#BDF9FD',
    tab_bar = {
        new_tab = { bg_color = "#121212", fg_color = "#FCE8C3", intensity = "Bold" },
    }
}
config.window_frame = {
    inactive_titlebar_bg = 'rgba(0,0,0,0)',
    active_titlebar_bg = 'rgba(0,0,0,0)',
}

config.keys = {
    {
        key = 'b',
        mods = 'CTRL',
        action = wezterm.action.EmitEvent 'toggle_opacity',
    },
    {
        key = 'c',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateCopyMode,
    },
    {
        key = 'v',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.PasteFrom 'Clipboard',
    },
}

return config
