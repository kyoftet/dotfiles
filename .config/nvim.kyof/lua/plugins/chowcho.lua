return {
    "tkmpypy/chowcho.nvim",
    config = function()
        require("chowcho").setup({
            labels = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" },
        })
        vim.keymap.set('n', '<C-w><C-w>', ':Chowcho<CR>')
    end,
}
