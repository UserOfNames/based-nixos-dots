vim.g.mapleader = " "

-- Normal mode
vim.keymap.set('n', '<Leader>ms', function() vim.o.spell = not(vim.o.spell) end)


vim.keymap.set('n', '<Enter>', 'o<Esc>')

-- Split commands are handled with left alt
-- Create splits
vim.keymap.set('n', '<M-v>', ':vsplit <Enter>', {silent = true})
vim.keymap.set('n', '<M-s>', ':split <Enter>', {silent = true})
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

-- Credit to ThePrimeagen for all of these
-- Move visual selection and auto-indent
vim.keymap.set('v', "J", ":m '>+1<Enter>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<Enter>gv=gv")
