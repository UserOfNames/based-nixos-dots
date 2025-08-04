local mk_map = require('helpers').mk_map

-- NOTE: Oil advises against lazy loading
require('oil').setup({
   default_file_explorer = true,

   view_options = {
      show_hidden = true
   },

   keymaps = {
      ['<C-->'] = 'actions.refresh',
      ['<C-l>'] = 'actions.select',
      ['<C-x>'] = 'actions.select_split'
   },
})

mk_map('n', '<Leader>fe', '<cmd>Oil<Enter>', 'Open oil in current buffer')
