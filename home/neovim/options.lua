local o = vim.o
local g = vim.g
local map = vim.keymap.set

-- Disable netrw, enable termguicolors as recommended by nvim-tree, set colorscheme
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd("colorscheme base16-tomorrow-night")



-- Main configs
o.syntax = true
o.number = true
o.hidden = true
o.hlsearch = false
o.foldenable = false
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'



-- Mappings
vim.g.mapleader = ","

-- All modes
map({'n', 'v', 'i'}, '<Leader>s', function() o.spell = not(o.spell) end)
map({'n', 'v', 'i'}, '<Leader>f', '<Esc>:NvimTreeToggle <Enter>', {silent = true})

-- Normal mode
map('n', '<Space>', 'i<Space><Right><Esc>')
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