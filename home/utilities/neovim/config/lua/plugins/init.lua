local lazy_load = require('lz.n').load

lazy_load('plugins.autopairs')
lazy_load('plugins.mini')
require('plugins.fff') -- Self-lazy-loads

require('plugins.completion')
require('plugins.programming')
require('plugins.ui')

vim.api.nvim_create_autocmd('FileType', {
   group = vim.api.nvim_create_augroup('TreesitterAutoSetup', { clear = true }),

   callback = function(args)
      local buf = args.buf
      local ft = vim.bo[buf].filetype

      -- Needed to prevent some weird bugs
      if not vim.api.nvim_buf_is_loaded(buf) then
         return
      end

      local lang = vim.treesitter.language.get_lang(ft) or ft
      local parser_exists = vim.treesitter.get_parser(buf, lang) or false

      if parser_exists then
         -- Syntax highlighting
         vim.treesitter.start(buf)

         -- Folding
         vim.opt_local.foldmethod = 'expr'
         vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      end
   end,
})
