local mk_map = require('helpers').mk_map

local function toggle_text()
   vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
   vim.diagnostic.config({ virtual_lines = false })
end

local function toggle_lines()
   vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
   vim.diagnostic.config({ virtual_text = false })
end

vim.diagnostic.config({
   virtual_text = true,
   severity_sort = true,
})

mk_map('n', 'gre', vim.diagnostic.open_float, 'Open floating diagnostic message')
mk_map('n', '<Leader>ld', toggle_text, 'Toggle LSP virtual text')
mk_map('n', '<Leader>ll', toggle_lines, 'Toggle LSP virtual lines')
