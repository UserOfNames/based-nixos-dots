local lazy_load = require('lz.n').load

require('plugins.programming.lsp')

if nixCats('programming.latex') or false then
   require('plugins.programming.vimtex') -- Don't lazy load
end

if nixCats('programming.typst') or false then
   lazy_load('plugins.programming.typst')
end

if nixCats('programming.git') or false then
   lazy_load('plugins.programming.diffview')
   lazy_load('plugins.programming.gitsigns')
   lazy_load('plugins.programming.neogit')
end
