vim.g.mapleader = " "

-- Normal mode
vim.keymap.set('n', '<Leader>s', function() vim.o.spell = not(vim.o.spell) end)


vim.keymap.set('n', '<Enter>', 'o<Esc>')

vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-h>', '<C-w>h')