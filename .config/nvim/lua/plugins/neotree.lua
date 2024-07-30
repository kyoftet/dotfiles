return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup({
            -- popup_border_style = "rounded",
            filesystem = {
                filtered_items = {
                    follow_current_file = true,
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            },
            window = {
                popup = {
                    size = { height = "55%", width = "55%" },
                    position = "50%",
                },
                mappings = {
                    ["o"] = "open",
                    ["h"] = "open_split",
                    ["v"] = "open_vsplit",
                }
            },
            vim.keymap.set('n', '<leader>e', '<cmd>Neotree float<cr>'),
            vim.keymap.set('n', '<leader>b', '<cmd>Neotree float buffers<cr>'),
            vim.keymap.set('n', '<leader>neo', '<cmd>Neotree left<cr>'),
        })
    end
}
