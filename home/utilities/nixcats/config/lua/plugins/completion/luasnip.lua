return {
   'luasnip',

   event = 'InsertEnter',

   load = function(name)
      vim.cmd.packadd(name)
      vim.cmd.packadd('friendly-snippets')
   end,

   after = function()
      local mk_map = require('helpers').mk_map
      local ls = require('luasnip')

      local function ls_jump(by)
         if ls.jumpable(by) then
            ls.jump(by)
         elseif ls.choice_active() then
            ls.change_choice(by)
         end
      end

      ls.config.setup({})
      require('luasnip.loaders.from_vscode').lazy_load({})
      require('luasnip.loaders.from_lua').lazy_load({paths = nixCats('nixCats_config_location')..'/snippets'})

      mk_map({ 'i', 's' }, '<C-n>', function() ls_jump(1) end, 'Jump to next point in snippet')
      mk_map({ 'i', 's' }, '<C-p>', function() ls_jump(-1) end, 'Jump to previous point in snippet')
   end,
}
