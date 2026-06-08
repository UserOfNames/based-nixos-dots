local mk_map = require('helpers').mk_map

vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('lsp_autocmds', {}),
   callback = function(args)
      local opts = { buffer = args.buf, silent = true }
      mk_map('n', 'grs', vim.lsp.buf.signature_help, 'LSP signature help', opts)
      mk_map('n', 'grf', vim.lsp.buf.format, 'LSP format buffer', opts)
      mk_map('n', 'grr', vim.lsp.buf.references, 'LSP references', opts)
      mk_map('n', 'gri', vim.lsp.buf.implementation, 'LSP implementations', opts)
   end,
})

mk_map('n', '<Leader>lh', function()
   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, 'Toggle inlay hints')

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
require('plugins.programming.lsp.nix')
vim.lsp.enable('basedpyright')
require('plugins.programming.lsp.rust')
