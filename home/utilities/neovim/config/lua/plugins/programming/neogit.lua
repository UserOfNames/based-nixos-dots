return {
   'neogit',

   cmd = 'Neogit',
   keys = {
      '<Leader>gs',
      '<Leader>gl',
      '<Leader>gb',
   },

   after = function()
      local mk_map = require('helpers').mk_map

      require('neogit').setup({
         kind = 'vsplit',
      })

      mk_map('n', '<Leader>gs', '<cmd>Neogit<Enter>', 'Open Neogit')
      mk_map('n', '<Leader>gl', '<cmd>Neogit log<Enter>', 'Open Neogit logs')
      mk_map('n', '<Leader>gb', '<cmd>Neogit branch<Enter>', 'Open Neogit branches')
   end,
}
