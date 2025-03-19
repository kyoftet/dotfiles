vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><C-a>', 'gg<S-v>G', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })

vim.keymap.set('i', 'jk', '<ESC>', { silent = true })
vim.keymap.set('i', 'JK', '<ESC>', { silent = true })
vim.keymap.set('i', 'jK', '<ESC>', { silent = true })
vim.keymap.set('i', 'Jk', '<ESC>', { silent = true })

for _, quote in ipairs({ '"', "'", "`" }) do
    vim.keymap.set({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
