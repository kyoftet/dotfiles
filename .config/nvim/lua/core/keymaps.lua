vim.g.mapleader = ' '

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })

vim.keymap.set('i', 'jk', '<ESC>', { silent = true })
vim.keymap.set('i', 'JK', '<ESC>', { silent = true })
vim.keymap.set('i', 'jK', '<ESC>', { silent = true })
vim.keymap.set('i', 'Jk', '<ESC>', { silent = true })
