local mk_map = require('helpers').mk_map

require('plugins.lsp.diagnostics')

mk_map('n', '<Leader>lh', function()
   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, 'Toggle inlay hints')

-- TODO: Evaluate LSP keymaps
mk_map('n', 'grs', vim.lsp.buf.signature_help, 'LSP signature help')
mk_map('n', 'grf', vim.lsp.buf.format, 'LSP format buffer')
mk_map('n', 'go', vim.lsp.buf.type_definition, 'LSP type definition')
