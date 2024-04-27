require('oil').setup({
   default_file_explorer = true,

   view_options = {
      show_hidden = true,
   },

   keymaps = {
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-x>'] = 'actions.select_split',
      ['<C-Space>'] = 'actions.select',
   },
})

-- Mappings
vim.keymap.set('n', '<Leader>fe', ':e . <Enter>', {silent = true})
