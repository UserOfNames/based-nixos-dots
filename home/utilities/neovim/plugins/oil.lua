require('oil').setup({
   default_file_explorer = true,

   view_options = {
      show_hidden = true,
   },

   keymaps = {
      ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, },
      ['<C-s>'] = { 'actions.select', opts = { vertical = true }, },
      ['<C-Space>'] = { 'actions.select' },
   },
})

-- Mappings
vim.keymap.set('n', '<Leader>fe', ':e . <Enter>', {silent = true})
