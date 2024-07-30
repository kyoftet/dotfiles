return {
    'akinsho/toggleterm.nvim',
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit  = Terminal:new({ cmd = "lazygit", dir = 'git_dir', direction = 'float', hidden = true })
        function _lazygit_toggle()
            lazygit:toggle()
        end

        require('toggleterm').setup {
            vim.keymap.set('n', '<Leader>tt', ':ToggleTerm direction=float<cr>'),
            vim.keymap.set('t', '<Leader>td', '<C-\\><C-n>:ToggleTerm<cr>'),
            vim.api.nvim_set_keymap("n", "<Leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true }),
        }
    end
}
