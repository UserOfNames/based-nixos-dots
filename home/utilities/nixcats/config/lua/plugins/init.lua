local lazy_load = require('lz.n').load

-- Core plugins; always on
lazy_load('plugins.autopairs')
lazy_load('plugins.mini')
require('plugins.snacks') -- Don't lazy load

if nixCats('completion') or false then
   require('plugins.completion')
end

if nixCats('programming') then
   require('plugins.programming')
end

if nixCats('ui') or false then
   require('plugins.ui')
end

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
      -- FIXME: This call will break in neovim version 0.12. Remove the opt table
      -- after updating. The pcall approach is inappropriate as it will ALSO be
      -- deprecated in 0.12 (the default behavior will be to return nil on
      -- error) and is also slower due to being exception-based.
      local parser_exists = vim.treesitter.get_parser(buf, lang, { error = false }) or false

      if parser_exists then
         -- Syntax highlighting
         vim.treesitter.start(buf)

         -- Folding
         vim.opt_local.foldmethod = 'expr'
         vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

         -- Intendation (experimental)
         vim.opt_local.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end
   end,
})
