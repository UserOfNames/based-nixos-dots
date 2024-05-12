vim.cmd([[
   hi Floaterm guibg = black
         hi FloatermBorder guibg = grey guifg = white
   let g:floaterm_wintype = "float"
        let g:floaterm_position = "bottomright"
        let g:floaterm_height = 0.5
   let g:floaterm_width = 0.5
]])

vim.keymap.set('t', '<Esc>', '<C-Bslash><C-n>')
vim.g.floaterm_keymap_toggle = '<Leader>tt'
vim.g.floaterm_keymap_new =  '<Leader>tn'
vim.g.floaterm_keymap_next = '<Leader>tl'
vim.g.floaterm_keymap_prev = '<Leader>th'
vim.g.floaterm_keymap_kill = '<Leader>tk'
vim.keymap.set('t', '<C-l>', vim.cmd.FloatermNext)
vim.keymap.set('t', '<C-h>', vim.cmd.FloatermPrev)
