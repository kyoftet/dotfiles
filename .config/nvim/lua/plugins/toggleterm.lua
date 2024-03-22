return {
        'akinsho/toggleterm.nvim',
        tag = "*",
        config = function()
            require('toggleterm').setup {
                vim.keymap.set('n', '<leader>tt', ':ToggleTerm size=50 direction=float<cr>'),
            }
        end
    }
