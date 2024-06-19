require('oil').setup({
   default_file_explorer = true,

   view_options = {
      show_hidden = true,
   },

   keymaps = {
      ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, },
      ['<C-s>'] = { 'actions.select', opts = { vertical = true }, },
      ['<C-Space>'] = { 'actions.select' },
      ['<C-l>'] = { 'actions.select' },
      ['<C-->'] = { 'actions.refresh' },
   },
})

-- Mappings
vim.keymap.set('n', '<Leader>fe', vim.cmd.Oil)
