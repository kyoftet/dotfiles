local wezterm = require("wezterm")

local tab_conf = {}

function tab_conf.setup(config)
    config.show_tabs_in_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.show_new_tab_button_in_tab_bar = false
    config.tab_bar_at_bottom = true
    config.tab_max_width = 50

    config.show_new_tab_button_in_tab_bar = false
    -- config.show_close_tab_button_in_tabs = false

    config.colors = {
        tab_bar = {
            inactive_tab_edge = "none",
        },
    }

    local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
    local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick
    wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
        local background = "#5c6d74"
        local foreground = "#FFFFFF"
        local edge_background = "none"
        if tab.is_active then
            background = "#13a6a8"
            foreground = "#FFFFFF"
        end
        local edge_foreground = background
        local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " "
        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_LEFT_ARROW },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_RIGHT_ARROW },
        }
    end)
end

return tab_conf
