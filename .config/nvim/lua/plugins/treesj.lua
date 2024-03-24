return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
        })
        vim.keymap.set('n', '<leader>tj', require('treesj').toggle)
    end,
}
