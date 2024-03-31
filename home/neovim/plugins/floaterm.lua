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
vim.keymap.set('n', '<Leader>t', ':FloatermToggle <Enter>', {silent = true})
vim.keymap.set('t', '<Leader>t', '<C-Bslash><C-n> :FloatermToggle <Enter>', {silent = true})
vim.keymap.set('n', '<F7>', ':FloatermNew <Enter>', {silent = true})
vim.keymap.set('t', '<F7>', '<C-Bslash><C-n> :FloatermNew <Enter>', {silent = true})
vim.keymap.set('n', '<F8>', ':FloatermPrev <Enter>', {silent = true})
vim.keymap.set('t', '<F8>', '<C-Bslash><C-n> :FloatermPrev <Enter>', {silent = true})
vim.keymap.set('n', '<F9>', ':FloatermNext <Enter>', {silent = true})
vim.keymap.set('t', '<F9>', '<C-Bslash><C-n> :FloatermNext <Enter>', {silent = true})
