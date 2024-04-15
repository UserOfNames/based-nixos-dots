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
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-Space>'] = cmp.mapping.complete(),
   },

   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
})
