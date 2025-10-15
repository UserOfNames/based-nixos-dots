return {
   'blink.cmp',

   event = {
      'InsertEnter',
      'CmdlineEnter',
   },

   after = function()
      require('blink-cmp').setup({
         completion = {
            documentation = {
               auto_show = true
            }
         },

         keymap = {
            ['<C-e>'] = { 'cancel' },
            ['<C-j>'] = { 'select_next' },
            ['<C-k>'] = { 'select_prev' },
            ['<C-l>'] = { 'accept' },
            preset = 'none',
         },

         snippets = {
            preset = 'luasnip',
         },

         sources = {
            default = {
               'lsp',
               'buffer',
               'snippets',
               'path',
            }
         },
      })
   end,
}
