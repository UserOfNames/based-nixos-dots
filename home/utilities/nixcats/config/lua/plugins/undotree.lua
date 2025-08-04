return {
   'undotree',

   event = 'DeferredUIEnter',

   after = function()
      local mk_map = require('helpers').mk_map

      local function toggle()
         vim.cmd.UndotreeToggle()
         vim.cmd.UndotreeFocus()
      end

      mk_map('n', '<Leader>u', toggle, 'Toggle undotree')
   end,
}
