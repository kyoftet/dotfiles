vim.g.mapleader = ' '

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', {silent=true})
vim.keymap.set('n', 'x', '"_x', {silent=true})
vim.keymap.set('n', 'Y', 'y$', {silent=true})
vim.keymap.set('n', '<Esc><Esc>', ':<C-u>set nohlsearch<Return>', {silent=true})
vim.keymap.set('i', 'jk', '<ESC>', {silent=true})
vim.keymap.set('i', ',', ',<Space>', {silent=true})

vim.keymap.set('n', 'wh', '<C-w>h', {silent=true})
vim.keymap.set('n', 'wj', '<C-w>j', {silent=true})
vim.keymap.set('n', 'wk', '<C-w>k', {silent=true})
vim.keymap.set('n', 'wl', '<C-w>l', {silent=true})

vim.keymap.set('n', '<S-j>', '5j', {silent=true})
vim.keymap.set('n', '<S-k>', '5k', {silent=true})

