return {
   'lualine.nvim',

   event = 'UIEnter',

   after = function()
      require('lualine').setup({
         options = {
            icons_enabled = true,
         },
      })
   end,
}
