local o = vim.o
local g = vim.g

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
