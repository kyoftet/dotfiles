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
        vim.keymap.set('n', '<Leader>ff', ':Telescope find_files hidden=true<cr>')
        vim.keymap.set('n', '<Leader>fl', ':Telescope live_grep<cr>')
        vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<cr>')
        vim.keymap.set('n', '<Leader>fk', ':Telescope keymaps<cr>')
        vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<cr>')
    end
}
