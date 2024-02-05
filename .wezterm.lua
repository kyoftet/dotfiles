local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on('toggle_opacity', function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity == 1 then
        overrides.window_background_opacity = 0.55
    else
        overrides.window_background_opacity = 1
    end
    window:set_config_overrides(overrides)
end)

---------
-- tab --
---------
local function TitleName(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end
wezterm.on('format-window-title', function(tab)
    return TitleName(tab.active_pane.foreground_process_name)
end)
wezterm.on('format-tab-title', function(tab, _, _, _, hover, _)
    local SYMBOL_COLOR = { '#ffb2cc', '#a4a4a4' }
    local FONT_COLOR = { '#dddddd', '#888888' }
    local index = tab.is_active and 1 or 2
    local bg = hover and '#434343' or '#2d2d2d'
    local zoomed = tab.active_pane.is_zoomed and '🔎 ' or ' '
    return {
        { Foreground = { Color = SYMBOL_COLOR[index] } },
        { Background = { Color = bg } },
        { Text = '' .. zoomed },
        { Foreground = { Color = FONT_COLOR[index] } },
        { Background = { Color = bg } },
        { Text = tab.active_pane.title },
    }
end)

-----------------------
-- status line const --
-----------------------
local SPACE_1 = ' '
local SPACE_3 = '   '
local DEFAULT_FG = { Color = '#9a9eab' }
local DEFAULT_BG = { Color = '#333333' }
-- local HEADER_HOST = { Foreground = { Color = '#75b1a9' }, Text = '' }
-- local HEADER_CWD = { Foreground = { Color = '#92aac7' }, Text = '' }
local HEADER_DATE = { Foreground = { Color = '#ffccac' }, Text = '󱪺' }
local HEADER_TIME = { Foreground = { Color = '#bcbabe' }, Text = '' }
local HEADER_BATTERY = { Foreground = { Color = '#dfe166' }, Text = '' }

local function AddElement(elems, header, str)
    table.insert(elems, { Foreground = header.Foreground })
    table.insert(elems, { Background = DEFAULT_BG })
    table.insert(elems, { Text = header.Text .. SPACE_1 })
    table.insert(elems, { Foreground = DEFAULT_FG })
    table.insert(elems, { Background = DEFAULT_BG })
    table.insert(elems, { Text = str .. SPACE_3 })
end
-- local function GetHostAndCwd(elems, pane)
--     local uri = pane:get_current_working_dir()
--     if not uri then
--         return
--     end
--     local cwd_uri = uri:sub(8)
--     local slash = cwd_uri:find '/'
--     if not slash then
--         return
--     end
--     local host = cwd_uri:sub(1, slash - 1)
--     local dot = host:find '[.]'
--     AddElement(elems, HEADER_HOST, dot and host:sub(1, dot - 1) or host)
--     AddElement(elems, HEADER_CWD, cwd_uri:sub(slash))
-- end
local function GetDate(elems)
    AddElement(elems, HEADER_DATE, wezterm.strftime '%a %b %-d')
end
local function GetTime(elems)
    AddElement(elems, HEADER_TIME, wezterm.strftime '%H:%M')
end
local function GetBattery(elems, _)
    for _, b in ipairs(wezterm.battery_info()) do
        AddElement(elems, HEADER_BATTERY, string.format('%.0f%%', b.state_of_charge * 100))
    end
end
local function RightUpdate(window, _)
    local elems = {}
    -- GetHostAndCwd(elems, pane)
    GetDate(elems)
    GetBattery(elems, window)
    GetTime(elems)
    window:set_right_status(wezterm.format(elems))
end
wezterm.on('update-status', function(window, pane)
    RightUpdate(window, pane)
end)

config.color_scheme = 'Tokyo Night'
config.window_background_gradient = {
    orientation = 'Horizontal',
    colors = {
        '#0f0c24',
        '#000045',
        '#0f0c55',
        '#002b55',
    },
    interpolation = 'Linear',
    blend = 'Rgb',
}
config.tab_bar_at_bottom = true
config.window_background_opacity = 1
config.font_size = 11
config.keys = {
    {
        key = 'b',
        mods = 'CTRL',
        action = wezterm.action.EmitEvent 'toggle_opacity',
    },
}

return config
