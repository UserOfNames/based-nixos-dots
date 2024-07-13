-- Remap default list binds since I use <C-l> for confirmation
vim.keymap.set('i', '<C-y><C-j>', '<Plug>VimwikiListNextSymbol')
vim.keymap.set('i', '<C-y><C-k>', '<Plug>VimwikiListPrevSymbol')
vim.keymap.set('i', '<C-y><C-m>', '<Plug>VimwikiListToggle')
