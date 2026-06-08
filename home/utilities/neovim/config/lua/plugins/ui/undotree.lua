return {
   'undotree',

   event = 'DeferredUIEnter',

   after = function()
      local mk_map = require('helpers').mk_map

      vim.cmd.packadd('nvim.undotree')

      mk_map('n', '<Leader>u', vim.cmd.Undotree, 'Toggle undotree')
   end,
}
