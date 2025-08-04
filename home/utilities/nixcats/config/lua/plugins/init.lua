if nixCats('programming') then
   require('plugins.lsp')
end

-- Core plugins; always on
local lazy_load = require('lz.n').load
lazy_load('plugins.autopairs')
lazy_load('plugins.mini')
lazy_load('plugins.treesitter')
require('plugins.snacks') -- Don't lazy load

if nixCats('completion') or false then
   lazy_load('plugins.blink-cmp')
   lazy_load('plugins.luasnip')
end

if nixCats('ui') or false then
   lazy_load('plugins.harpoon')
   lazy_load('plugins.lualine')
   lazy_load('plugins.undotree')
   lazy_load('plugins.whichkey')
   require('plugins.oil') -- Don't lazy load
end

if nixCats('programming.vimtex') or false then
   require('plugins.vimtex') -- Don't lazy load
end

if nixCats('programming.git') or false then
   lazy_load('plugins.diffview')
   lazy_load('plugins.gitsigns')
   lazy_load('plugins.neogit')
end
