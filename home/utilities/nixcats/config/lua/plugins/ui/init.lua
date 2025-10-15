local lazy_load = require('lz.n').load

lazy_load('plugins.ui.harpoon')
lazy_load('plugins.ui.lualine')
lazy_load('plugins.ui.render-markdown')
lazy_load('plugins.ui.undotree')
lazy_load('plugins.ui.whichkey')
require('plugins.ui.oil') -- Don't lazy load
