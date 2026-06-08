return {
   'which-key.nvim',

   event = 'DeferredUIEnter',

   after = function()
      require('which-key').setup({
         delay = function(ctx)
            return ctx.plugin and 0 or 1500
         end,
      })
   end,
}
