local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
   }, {
      { name = 'buffer' },
   }),

   mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-Space>'] = cmp.mapping.confirm({ select = true }),

      -- These are default, but I prefer space to confirm and complete doesn't work for some reason
      -- Kept in case I change my mind or something
      -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      -- ['<C-Space>'] = cmp.mapping.complete(),
   },

   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
})
