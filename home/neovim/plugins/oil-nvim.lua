require('oil').setup({
	view_options = {
		show_hidden = true
	}
})

-- Mappings
vim.keymap.set('n', '<Leader>ft', ':e . <Enter>', {silent = true})
