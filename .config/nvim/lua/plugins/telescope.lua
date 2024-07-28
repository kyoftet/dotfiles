return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = actions.select_horizontal,
                    },
                    n = {
                        ["<C-c>"] = actions.close,
                        ["<C-h>"] = actions.select_horizontal,
                    }
                },
            },
        })
        vim.keymap.set('n', '<leader>f', ':Telescope find_files hidden=true<cr>')
        vim.keymap.set('n', '<C-f>l', ':Telescope live_grep<cr>')
        vim.keymap.set('n', '<C-f>h', ':Telescope help_tags<cr>')
        vim.keymap.set('n', '<C-f>gs', ':Telescope git_status<cr>')
        vim.keymap.set('n', '<C-f>gc', ':Telescope git_commits<cr>')
        vim.keymap.set('n', '<C-f>k', ':Telescope keymaps<cr>')
        vim.keymap.set('n', '<C-f>b', ':Telescope buffers<cr>')
    end
}
