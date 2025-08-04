return {
   'gitsigns.nvim',

   event = 'DeferredUIEnter',

   after = function()
      local mk_map = require('helpers').mk_map
      local gs = require('gitsigns')

      gs.setup({})

      mk_map('n', '<Leader>ghh', '<cmd>Gitsigns<Enter>', 'Open gitsigns menu')
      mk_map('n', ']h', function() gs.nav_hunk('next') end, 'Next hunk')
      mk_map('n', '[h', function() gs.nav_hunk('prev') end, 'Previous hunk')
      mk_map('n', '<Leader>ghs', gs.stage_hunk, 'Stage hunk')
      mk_map('n', '<Leader>ghu', gs.undo_stage_hunk, 'Undo stage hunk')
      mk_map('n', '<Leader>ghr', gs.reset_hunk, 'Reset hunk')
      mk_map('n', '<Leader>ghp', gs.preview_hunk, 'Preview hunk')
   end,
}
