local wezterm = require("wezterm")

wezterm.on('toggle_opacity', function(window)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity == 0.81 then
        overrides.window_background_opacity = 0.55
        overrides.macos_window_background_blur = 0
    else
        overrides.window_background_opacity = 0.81
        overrides.macos_window_background_blur = 15
    end
    window:set_config_overrides(overrides)
end)

local key_conf = {}

function key_conf.setup(config)
    config.disable_default_key_bindings = true
    config.leader = { key = "l", mods = 'CTRL' }
    config.keys = {
        -- with leader key
        { key = "t", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "h", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "n", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(-1) },
        { key = "m", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(1) },
        { key = "d", mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
        { key = "w", mods = "LEADER",       action = wezterm.action { CloseCurrentTab = { confirm = true } } },
        { key = "f", mods = "LEADER",       action = wezterm.action.ToggleFullScreen },
        { key = "q", mods = "LEADER",       action = wezterm.action.QuitApplication },
        { key = "p", mods = "LEADER",       action = wezterm.action.ActivateCommandPalette },
        { key = "o", mods = "LEADER",       action = wezterm.action.EmitEvent 'toggle_opacity' },
        { key = "=", mods = "LEADER",       action = wezterm.action.IncreaseFontSize },
        { key = "-", mods = "LEADER",       action = wezterm.action.DecreaseFontSize },
        { key = "N", mods = "LEADER|SHIFT", action = wezterm.action.SpawnWindow },
        { key = "V", mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "s", mods = "LEADER|CTRL",  action = wezterm.action.QuickSelect },
        { key = "c", mods = "LEADER|CTRL",  action = wezterm.action.ActivateCopyMode },
        { key = "v", mods = "LEADER|CTRL",  action = wezterm.action.PasteFrom "Clipboard" },
        {
            key = 'n',
            mods = 'LEADER|CTRL',
            action = wezterm.action.PromptInputLine {
                description = "(wezterm) Create new workspace:",
                action = wezterm.action_callback(function(window, pane, line)
                    if line then
                        window:perform_action(
                            wezterm.action.SwitchToWorkspace {
                                name = line,
                            },
                            pane
                        )
                    end
                end),
            },
        },
        {
            key = 'w',
            mods = 'LEADER|CTRL',
            action = wezterm.action_callback(function(win, pane)
                local workspaces = {}
                for i, name in ipairs(wezterm.mux.get_workspace_names()) do
                    table.insert(workspaces, {
                        id = name,
                        label = string.format("%d. %s", i, name),
                    })
                end
                win:perform_action(wezterm.action.InputSelector {
                    action = wezterm.action_callback(function(_, _, id, label)
                        if not id and not label then
                            wezterm.log_info "Workspace selection canceled"
                        else
                            win:perform_action(wezterm.action.SwitchToWorkspace { name = id }, pane)
                        end
                    end),
                    title = "Select workspace",
                    choices = workspaces,
                    fuzzy = true,
                }, pane)
            end),
        },
        -- without leader key
        { key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
        { key = "m", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
        { key = "-", mods = "ALT", action = wezterm.action.DecreaseFontSize },
        { key = "=", mods = "ALT", action = wezterm.action.IncreaseFontSize },
        { key = "h", mods = "ALT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "j", mods = "ALT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "k", mods = "ALT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "l", mods = "ALT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    }
end

return key_conf
