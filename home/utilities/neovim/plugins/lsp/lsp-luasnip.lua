local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

require('luasnip.loaders.from_vscode').lazy_load()

vim.keymap.set({ 'i', 's' }, '<C-n>', function()
   if ls.expand_or_jumpable() then
      ls.expand_or_jump()
   elseif ls.choice_active() then
      ls.change_choice(1)
   end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-p>', function()
   if ls.jumpable(-1) then
      ls.jump(-1)
   elseif ls.choice_active() then
      ls.change_choice(-1)
   end
end, { silent = true })
