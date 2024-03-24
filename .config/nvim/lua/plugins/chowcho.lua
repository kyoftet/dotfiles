return {
    "tkmpypy/chowcho.nvim",
    config = function()
        require("chowcho").setup({
            labels = { "a", "b", "c", "d", "e", "f", "g", "h", "i" },
        })
        vim.keymap.set('n', '<C-w><C-w>', '<CMD>Chowcho<CR>')

    end,
}
