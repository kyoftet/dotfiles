return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.keymap.set('n', 'tf', ':Telescope find_files hidden=true<cr>')
        vim.keymap.set('n', 'tg', ':Telescope live_grep<cr>')
        vim.keymap.set('n', 'tgs', ':Telescope git_status<cr>')
        vim.keymap.set('n', 'tgc', ':Telescope git_commits<cr>')
        vim.keymap.set('n', 'tk', ':Telescope keymaps<cr>')
        vim.keymap.set('n', 'tb', ':Telescope buffers<cr>')
    end
}
