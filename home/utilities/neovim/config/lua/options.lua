vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Wildmenu: fuzzy, popup, longest match first
vim.opt.wildmenu = true
vim.opt.wildoptions = { 'pum', 'fuzzy' }
vim.opt.wildmode = "longest:full,full"

-- Spaces instead of tabs, default width 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

vim.opt.foldenable = false
vim.opt.foldlevelstart = 99

vim.opt.winborder = 'rounded'
