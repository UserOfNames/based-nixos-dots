require('telescope').setup({
   defaults = {
      mappings = {
         i = {
            ['<C-Space>'] = 'select_default',
            ['<C-s>'] = 'select_vertical',
            ['C-l'] = 'select_default',
         },

         n = {
            ['<C-Space>'] = 'select_default',
            ['<Space>'] = 'select_default',
            ['C-l'] = 'select_default',
            ['<C-s>'] = 'select_vertical',
         },
      }
   }
})

-- Mappings
vim.keymap.set('n', '<Leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Leader>fg', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<Leader>fs', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<Leader>fd', require('telescope.builtin').diagnostics, {})
