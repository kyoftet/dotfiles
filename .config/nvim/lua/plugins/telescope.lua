return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.keymap.set('n', '<leader>tf', ':Telescope find_files hidden=true<cr>')
        vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>tgs', ':Telescope git_status<cr>')
        vim.keymap.set('n', '<leader>tgl', ':Telescope git_commits<cr>')
        vim.keymap.set('n', '<leader>tk', ':Telescope keymaps<cr>')
        vim.keymap.set('n', '<leader>tb', ':Telescope buffers<cr>')
    end
}
