local map = vim.keymap.set
local builtin = require('telescope.builtin')
vim.g.mapleader = " "

-- Normal mode
map('n', '<Leader>s', function() o.spell = not(o.spell) end)

map('n', '<Leader>ft', '<Esc>:NvimTreeToggle <Enter>', {silent = true})

map('n', '<Enter>', 'o<Esc>')

map('n', '<M-k>', '<C-w>k')
map('n', '<M-j>', '<C-w>j')
map('n', '<M-l>', '<C-w>l')
map('n', '<M-h>', '<C-w>h')



-- Terminal maps
map('t', '<Esc>', '<C-Bslash><C-n>')
map('n', '<Leader>t', ':FloatermToggle <Enter>', {silent = true})
map('t', '<Leader>t', '<C-Bslash><C-n> :FloatermToggle <Enter>', {silent = true})
map('n', '<F7>', ':FloatermNew <Enter>', {silent = true})
map('t', '<F7>', '<C-Bslash><C-n> :FloatermNew <Enter>', {silent = true})
map('n', '<F8>', ':FloatermPrev <Enter>', {silent = true})
map('t', '<F8>', '<C-Bslash><C-n> :FloatermPrev <Enter>', {silent = true})
map('n', '<F9>', ':FloatermNext <Enter>', {silent = true})
map('t', '<F9>', '<C-Bslash><C-n> :FloatermNext <Enter>', {silent = true})



-- Telescope
map('n', '<Leader>ff', builtin.find_files, {})
map('n', '<Leader>fb', builtin.buffers, {})
