local lazy_load = require('lz.n').load

-- Core plugins; always on
lazy_load('plugins.autopairs')
lazy_load('plugins.mini')
lazy_load('plugins.treesitter')
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
