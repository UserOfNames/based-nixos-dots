local lazy_load = require('lz.n').load

require('plugins.programming.lsp')
require('plugins.programming.vimtex') -- Don't lazy load
lazy_load('plugins.programming.typst')
lazy_load('plugins.programming.diffview')
lazy_load('plugins.programming.gitsigns')
lazy_load('plugins.programming.neogit')
