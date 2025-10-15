return {
   'diffview.nvim',

   cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
      'DiffviewFocusFiles',
      'DiffviewLog',
      'DiffviewRefresh',
      'DiffviewToggleFiles',
   },

   keys = {
      '<Leader>gdd',
   },

   after = function()
      local mk_map = require('helpers').mk_map

      require('diffview').setup({
         use_icons = true
      })

      mk_map('n', '<Leader>gdd', '<cmd>DiffviewOpen<Enter>', 'Open diffview')
   end,
}
