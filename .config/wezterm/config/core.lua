local core_conf = {}

function core_conf.setup(config)
    config.adjust_window_size_when_changing_font_size = false
    config.check_for_updates = false
    config.initial_cols = 155
    config.initial_rows = 45
    config.hyperlink_rules = {
        {
            regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
            format = "$0",
        },
        {
            regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = "mailto:$0",
        },
        {
            regex = [[\bfile://\S*\b]],
            format = "$0",
        },
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = "$0",
        },
        {
            regex = [[\b[tT](\d+)\b]],
            format = "https://example.com/tasks/?t=$1",
        },
    }
    config.mouse_wheel_scrolls_tabs = false
    config.show_update_window = false
    config.warn_about_missing_glyphs = false
    config.window_close_confirmation = "NeverPrompt"
end

return core_conf
