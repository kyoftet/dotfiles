local wezterm = require("wezterm")
local colors = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

local tab_conf = {}

local function get_process(tab)
    local PROCESS_ICONS = {
        ["docker"] = {
            { Foreground = { Color = colors.blue } },
            { Text = "󰡨" },
        },
        ["docker-compose"] = {
            { Foreground = { Color = colors.blue } },
            { Text = "󰡨" },
        },
        ["nvim"] = {
            { Foreground = { Color = colors.green } },
            { Text = "" },
        },
        ["vim"] = {
            { Foreground = { Color = colors.green } },
            { Text = "" },
        },
        ["node"] = {
            { Foreground = { Color = colors.green } },
            { Text = "󰋘" },
        },
        ["zsh"] = {
            { Foreground = { Color = colors.peach } },
            { Text = "" },
        },
        ["cargo"] = {
            { Foreground = { Color = colors.peach } },
            { Text = wezterm.nerdfonts.dev_rust },
        },
        ["go"] = {
            { Foreground = { Color = colors.sapphire } },
            { Text = "" },
        },
        ["git"] = {
            { Foreground = { Color = colors.peach } },
            { Text = "󰊢" },
        },
        ["lazygit"] = {
            { Foreground = { Color = colors.mauve } },
            { Text = "󰊢" },
        },
        ["lua"] = {
            { Foreground = { Color = colors.blue } },
            { Text = "" },
        },
        ["wget"] = {
            { Foreground = { Color = colors.yellow } },
            { Text = "󰄠" },
        },
        ["curl"] = {
            { Foreground = { Color = colors.yellow } },
            { Text = "" },
        },
        ["gh"] = {
            { Foreground = { Color = colors.mauve } },
            { Text = "" },
        },
    }

    local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

    if PROCESS_ICONS[process_name] then
        return wezterm.format(PROCESS_ICONS[process_name])
    elseif process_name == "" then
        return wezterm.format({
            { Foreground = { Color = colors.red } },
            { Text = "󰌾" },
        })
    else
        return wezterm.format({
            { Foreground = { Color = colors.blue } },
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
    config.tab_bar_at_bottom = true
    config.show_new_tab_button_in_tab_bar = false
    config.tab_max_width = 50
    config.hide_tab_bar_if_only_one_tab = true

    wezterm.on("format-tab-title", function(tab)
        return wezterm.format({
            { Text = "  " },
            { Attribute = { Intensity = "Half" } },
            { Text = string.format("%s", tab.tab_index + 1) },
            "ResetAttributes",
            { Text = " " },
            { Text = get_process(tab) },
            { Text = " " },
            { Text = get_current_working_dir(tab) },
            { Foreground = { Color = colors.base } },
        })
    end)
end

return tab_conf
