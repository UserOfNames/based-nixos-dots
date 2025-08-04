return {
   'mini.nvim',

   event = 'DeferredUIEnter',

   after = function()
      require('mini.move').setup({
         mappings = {
            down = "J",
            left = "H",
            line_down = "",
            line_left = "",
            line_right = "",
            line_up = "",
            right = "L",
            up = "K",
         },
      })

      require('mini.surround').setup({})

      require('mini.icons').setup({})
   end,
}
