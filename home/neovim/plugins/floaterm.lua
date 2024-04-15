vim.cmd([[
   hi Floaterm guibg = black
         hi FloatermBorder guibg = grey guifg = white
   let g:floaterm_wintype = "float"
        let g:floaterm_position = "bottomright"
        let g:floaterm_height = 0.5
   let g:floaterm_width = 0.5
]])

-- Mappings
vim.keymap.set('t', '<Esc>', '<C-Bslash><C-n>')
vim.keymap.set('n', '<Leader>tt', ':FloatermToggle <Enter>', {silent = true})
vim.keymap.set('t', '<Leader>tt', '<C-Bslash><C-n> :FloatermToggle <Enter>', {silent = true})
vim.keymap.set('n', '<Leader>tn', ':FloatermNew <Enter>', {silent = true})
vim.keymap.set('t', '<Leader>tn', '<C-Bslash><C-n> :FloatermNew <Enter>', {silent = true})
vim.keymap.set('n', '<Leader>th', ':FloatermPrev <Enter>', {silent = true})
vim.keymap.set('t', '<Leader>th', '<C-Bslash><C-n> :FloatermPrev <Enter>', {silent = true})
vim.keymap.set('n', '<Leader>tl', ':FloatermNext <Enter>', {silent = true})
vim.keymap.set('t', '<Leader>tl', '<C-Bslash><C-n> :FloatermNext <Enter>', {silent = true})
