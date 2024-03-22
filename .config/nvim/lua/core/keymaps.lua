vim.g.mapleader = ' '

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', {silent=true})
vim.keymap.set('n', 'x', '"_x', {silent=true})
vim.keymap.set('n', 'Y', 'y$', {silent=true})
vim.keymap.set('n', '<Esc><Esc>', ':<C-u>set nohlsearch<Return>', {silent=true})
vim.keymap.set('i', 'jk', '<ESC>', {silent=true})

vim.keymap.set('n', '<leader>h', '<C-w>h', {silent=true})
vim.keymap.set('n', '<leader>j', '<C-w>j', {silent=true})
vim.keymap.set('n', '<leader>k', '<C-w>k', {silent=true})
vim.keymap.set('n', '<leader>l', '<C-w>l', {silent=true})

vim.keymap.set('n', '<C-j>', '5j', {silent=true})
vim.keymap.set('n', '<C-k>', '5k', {silent=true})

vim.keymap.set('n', '<C-t> m', ':tabnext', {silent=true})
vim.keymap.set('n', '<C-t> n', ':tabprevios', {silent=true})
