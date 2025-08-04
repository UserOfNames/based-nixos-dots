return {
   'nvim-autopairs',

   event = 'InsertEnter',

   after = function()
      require('nvim-autopairs').setup({
         map_cr = true,
      })
   end,
}
