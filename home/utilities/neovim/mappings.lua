vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>os', function() vim.o.spell = not(vim.o.spell) end)
vim.keymap.set('n', '<Leader>q', '@q')
vim.keymap.set({ 'n', 'i', 'c' }, '<C-l>', '<Enter>')



-- Split commands are handled with left alt
-- Create splits
vim.keymap.set('n', '<M-v>', vim.cmd.vsplit)
vim.keymap.set('n', '<M-s>', vim.cmd.split)

-- Navigate splits
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-h>', '<C-w>h')
-- Resize splits
vim.keymap.set('n', '<M-K>', '<C-w>+')
vim.keymap.set('n', '<M-J>', '<C-w>-')
vim.keymap.set('n', '<M-L>', '<C-w>>')
vim.keymap.set('n', '<M-H>', '<C-w><')
-- Swap splits
vim.keymap.set('n', '<M-x>', '<C-w>x')
