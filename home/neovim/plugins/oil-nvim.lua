require('oil').setup({
	default_file_explorer = true,

	view_options = {
		show_hidden = true,
	},

	keymaps = {
		['<C-v>'] = 'actions.select_vsplit',
		['<C-x>'] = 'actions.select_split',
	},
})

-- Mappings
vim.keymap.set('n', '<Leader>ft', ':e . <Enter>', {silent = true})
