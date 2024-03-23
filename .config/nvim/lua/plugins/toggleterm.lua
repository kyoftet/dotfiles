return {
    'akinsho/toggleterm.nvim',
    tag = "*",
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit  = Terminal:new({ cmd = "lazygit", dir = 'git_dir', direction = 'float', hidden = true })
        function _lazygit_toggle()
            lazygit:toggle()
        end

        require('toggleterm').setup {
            vim.keymap.set('n', 'tp', ':ToggleTerm direction=float<cr>'),
            vim.keymap.set('t', '<C-g>', '<C-\\><C-n>:ToggleTerm<cr>'),
            vim.api.nvim_set_keymap("n", "tlg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true }),
        }
    end
}
