local wezterm = require("wezterm")

local tab_conf = {}

local function get_process(tab)
    local PROCESS_ICONS = {
        ["docker"] = {
            { Foreground = { Color = "blue" } },
            { Text = "󰡨" },
        },
        ["docker-compose"] = {
            { Foreground = { Color = "blue" } },
            { Text = "󰡨" },
        },
        ["nvim"] = {
            { Foreground = { Color = "green" } },
            { Text = "" },
        },
        ["vim"] = {
            { Foreground = { Color = "green" } },
            { Text = "" },
        },
        ["node"] = {
            { Foreground = { Color = "green" } },
            { Text = "󰋘" },
        },
        ["zsh"] = {
            { Foreground = { Color = "gray" } },
            { Text = "" },
        },
        ["cargo"] = {
            { Foreground = { Color = "maroon" } },
            { Text = wezterm.nerdfonts.dev_rust },
        },
        ["go"] = {
            { Foreground = { Color = "blue" } },
            { Text = "" },
        },
        ["git"] = {
            { Foreground = { Color = "orange" } },
            { Text = "󰊢" },
        },
        ["lazygit"] = {
            { Foreground = { Color = "orange" } },
            { Text = "󰊢" },
        },
        ["lua"] = {
            { Foreground = { Color = "blue" } },
            { Text = "" },
        },
        ["wget"] = {
            { Foreground = { Color = "yellow" } },
            { Text = "󰄠" },
        },
        ["curl"] = {
            { Foreground = { Color = "yellow" } },
            { Text = "" },
        },
        ["gh"] = {
            { Foreground = { Color = "gray" } },
            { Text = "" },
        },
    }

    local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

    if PROCESS_ICONS[process_name] then
        return wezterm.format(PROCESS_ICONS[process_name])
    elseif process_name == "" then
        return wezterm.format({
            { Foreground = { Color = "red" } },
            { Text = "󰌾" },
        })
    else
        return wezterm.format({
            { Foreground = { Color = "blue" } },
            { Text = string.format("[%s]", process_name) },
        })
    end
end

local function get_current_working_dir(tab)
    local cwd_uri = tab.active_pane.current_working_dir

    if cwd_uri then
        local cwd = ""
        if type(cwd_uri) == "userdata" then
            cwd = cwd_uri.file_path
        else
            cwd_uri = cwd_uri:sub(8)
            local slash = cwd_uri:find("/")
            if slash then
                cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
                    return string.char(tonumber(hex, 16))
                end)
            end
        end

        if cwd == os.getenv("HOME") then
            return "~"
        end

        return string.format("%s", string.match(cwd, "[^/]+$"))
    end
end

function tab_conf.setup(config)
    config.hide_tab_bar_if_only_one_tab = true
    config.show_new_tab_button_in_tab_bar = false
    config.tab_bar_at_bottom = true
    config.tab_max_width = 50

    wezterm.on("format-tab-title", function(tab)
        local bg_color = { "#03214a", "#010b19" }
        local fg_color = { "white", "gray" }
        local is_active = tab.is_active and 1 or 2
        return wezterm.format({
            { Background = { Color = bg_color[is_active] } },
            { Text = " " .. get_process(tab) },
            { Foreground = { Color = fg_color[is_active] } },
            { Text = " " .. get_current_working_dir(tab) },
        })
    end)
end

return tab_conf
