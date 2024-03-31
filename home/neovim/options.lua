-- Disable netrw, enable termguicolors as recommended by nvim-tree, set colorscheme
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd("colorscheme base16-tomorrow-night")



-- Main configs
vim.o.syntax = true
vim.o.number = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.foldenable = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
