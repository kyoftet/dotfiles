return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('neo-tree').setup({
                filesystem = {
                    filtered_items = {
                        follow_current_file = true,
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            'node_modules',
                        },
                        never_show = {
                            '.git',
                            '.DS_Store',
                        }
                    }
                },
                window = {
                    position = "float",
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
                vim.keymap.set('n', '<leader>e', ':Neotree<cr>'),
            })
        end
    }
