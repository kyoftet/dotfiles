return {
    'goolord/alpha-nvim',
    config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        local dashboard = require('alpha.themes.dashboard')
        dashboard.section.header.val = {
            [[⠀⠀ ⡀⠊⠡⡀⠀⠀⠀⠀⠀⡍⢢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
            [[ ⢠⡎⢠⠁⠀⠐⡄⠀⠀⠀⠀⡇⢲⡌⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
            [[ ⡇⠹⣆⠌⠐⢀⠐⢄⠀⠀⠀⡍⢦⡹⣌⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⢀⣀⣀⣛⣛⡃⡀⢀⠀⣀⣀⡀⠀⠀⣀⣀⡀⠀ ]],
            [[ ⢣⠓⣬⢳⠈⠀⠄⡈⢂⠀⠀⡟⣦⢳⡬⡇⠀⠀⠀⢸⣧⡖⠛⠙⠻⣦⠀⢀⡶⠛⠉⠙⢲⣄⠀⣴⠞⠛⠙⠛⣦⡘⣿⣿⡆⠀⢀⣾⣿⠏⣿⣿⠇⣿⣿⣿⠿⠿⣿⣶⡿⠿⢿⣿⣦ ]],
            [[ ⣇⠻⣔⢫⠓⡈⠄⡐⠀⡑⡀⡿⣜⢧⣳⡇⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⠇⣿⣧⣤⣤⣤⣤⣿⣼⡟⠀⠀⠀⠀⢸⣷⠸⣿⣷⡀⣼⣿⡏⠀⣿⣿⡇⣻⣿⡇⠀⠀⣿⣿⠁⠀⢸⣿⣿ ]],
            [[ ⡝⡶⣙⢮⠀⠑⡠⢁⠂⡁⢡⣷⣻⡼⣏⡇⠀⠀⠀⢸⣟⠀⠀⠀⠀⣿⠄⣿⡉⠉⠉⠉⠉⠉⢽⡇⠀⠀⠀⠀⢸⣿⠀⢻⣿⣷⣿⡿⠁⠀⣿⣿⠇⣻⣿⡇⠀⠀⣿⣿⡀⠀⢸⣿⣿ ]],
            [[ ⣯⢳⡽⣺⠀⠀⠈⢆⠰⡈⠤⢸⢷⣻⡽⡇⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⡂⠙⣷⣀⠀⢀⣠⡤⠈⢿⣄⠀⠀⣀⣾⠏⠀⠈⢿⣿⣿⠃⠀⠀⣿⣿⡇⣿⣿⡇⠀⠀⣿⣿⠀⠀⢸⣿⣿ ]],
            [[ ⣯⣟⡾⣽⠀⠀⠀⠀⠣⡘⢤⢹⣎⢿⣽⡣⠀⠀⠀⠈⠉⠀⠀⠀⠀⠉⠁⠀⠀⠉⠉⠉⠉⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠉⠉⠁⠉⠉⠁⠀⠀⠉⠉⠁⠀⠈⠉⠉ ]],
            [[ ⠘⠼⣿⣻⠀⠀⠀⠀⠀⠣⡜⣸⡼⣛⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
            [[ ⠀⠀⠉⢿⠀⠀⠀⠀⠀⠀⠱⣼⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files hidden=true<cr>"),
            dashboard.button("h", "󰋖  Find help", ":Telescope help_tags<cr>"),
            dashboard.button("e", "  View dir", ":Neotree float<cr>"),
            dashboard.button("l", "  Check lsp", ":Mason<cr>"),
            dashboard.button("t", "  Toggle terminal", ":ToggleTerm direction=float<cr>"),
            dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        }
    end
}
