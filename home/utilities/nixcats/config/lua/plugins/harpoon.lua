return {
   'harpoon2',

   event = 'DeferredUIEnter',

   after = function()
      local mk_map = require('helpers').mk_map
      local hp = require('harpoon')

      hp:setup({})

      mk_map('n', '<Leader>hh', function() hp.ui:toggle_quick_menu(hp:list()) end, 'Open harpoon menu')
      mk_map('n', '<Leader>ha', function() hp:list():add() end, 'Add file to harpoon')

      for i = 1, 9, 1 do
         local s = tostring(i)
         mk_map('n', '<Leader>'..s, function() hp:list():select(i) end, 'Navigate to harpoon item '..s)
      end
   end,
}
