-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")

-- Misc settings
vim.o.number = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.wrap = false
vim.o.scrolloff = 8

-- Tab settings - Use spaces instead of tabs, default width 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Fold settings - Use treesitter folding, fold nothing by default
vim.o.foldenable = false
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
