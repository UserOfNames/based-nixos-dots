local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
   preselect = 'item',
   completion = {
      completeopt = 'menu,menuone,noinsert'
   },

   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
   }, {
      { name = 'buffer' },
   }),

   mapping = {
      ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
      ['<C-l>'] = cmp.mapping.confirm({ select = true }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.abort(),
   },

   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
})
