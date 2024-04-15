local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
   lsp_zero.default_keymaps({bufnr = bufnr})

   vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<Enter>', {buffer = bufnr})
end)
