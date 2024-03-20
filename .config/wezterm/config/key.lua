local wezterm = require("wezterm")

wezterm.on('toggle_opacity', function(window)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity == 1 then
        overrides.window_background_opacity = 0.55
    else
        overrides.window_background_opacity = 1
    end
    window:set_config_overrides(overrides)
end)

local key_conf = {}

function key_conf.setup(config)
    config.disable_default_key_bindings = true
    config.leader = { key = "l", mods = 'CTRL' }
    config.keys = {
        -- with leader key
        { key = "u", mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "y", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "t", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "N", mods = "LEADER|SHIFT", action = wezterm.action.SpawnWindow },
        { key = "h", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
        { key = "n", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(-1) },
        { key = "m", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(1) },
        { key = "T", mods = "LEADER|SHIFT", action = wezterm.action.ShowTabNavigator },
        { key = "d", mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
        { key = "w", mods = "LEADER",       action = wezterm.action { CloseCurrentTab = { confirm = true } } },
        { key = "f", mods = "LEADER",       action = wezterm.action.ToggleFullScreen },
        { key = "P", mods = "LEADER|SHIFT", action = wezterm.action.ShowLauncher },
        { key = "q", mods = "LEADER",       action = wezterm.action.QuitApplication },
        { key = "s", mods = "LEADER|SHIFT", action = wezterm.action.QuickSelect },
        { key = "c", mods = "LEADER|CTRL",  action = wezterm.action.ActivateCopyMode },
        { key = "v", mods = "LEADER|CTRL",  action = wezterm.action.PasteFrom "Clipboard" },
        { key = "p", mods = "LEADER",       action = wezterm.action.ActivateCommandPalette },
        { key = "o", mods = "LEADER",       action = wezterm.action.EmitEvent 'toggle_opacity' },
        { key = "=", mods = "LEADER",       action = wezterm.action.IncreaseFontSize },
        { key = "-", mods = "LEADER",       action = wezterm.action.DecreaseFontSize },
        -- without leader key
        { key = "=", mods = "ALT",          action = wezterm.action.IncreaseFontSize },
        { key = "-", mods = "ALT",          action = wezterm.action.DecreaseFontSize },
        { key = "u", mods = "ALT",          action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "y", mods = "ALT",          action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "h", mods = "ALT",          action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "ALT",          action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "ALT",          action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "ALT",          action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "H", mods = "ALT|SHIFT",    action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "J", mods = "ALT|SHIFT",    action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "K", mods = "ALT|SHIFT",    action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "L", mods = "ALT|SHIFT",    action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
        { key = "n", mods = "ALT",          action = wezterm.action.ActivateTabRelative(-1) },
        { key = "m", mods = "ALT",          action = wezterm.action.ActivateTabRelative(1) },
    }
end

return key_conf
