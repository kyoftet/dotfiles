return {
    'goolord/alpha-nvim',
    config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        local dashboard = require('alpha.themes.dashboard')
        dashboard.section.buttons.val = {
            dashboard.button("e", "  View dir", ":Neotree float<CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files hidden=true<CR>"),
            dashboard.button("h", "󰋖  Find help", ":Telescope help_tags<CR>"),
            dashboard.button("k", "  Find keymap", ":Telescope keymaps<CR>"),
            dashboard.button("g", "  Lazy Git", ":lua _lazygit_toggle()<CR>"),
            dashboard.button("l", "  Check lsp", ":Mason<CR>"),
            dashboard.button("t", "  Toggle terminal", ":ToggleTerm direction=float<CR>"),
            dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        }
    end
}
