return {
   'render-markdown.nvim',

   event = 'DeferredUIEnter',

   after = function()
      local mk_map = require('helpers').mk_map
      local rm = require('render-markdown')

      rm.setup({
         file_types = { 'markdown' },

         render_modes = { 'n', 'c', 't', 'i' },
      })

      mk_map('n', '<Leader>mm', rm.toggle, 'Toggle markdown rendering')
   end,
}
