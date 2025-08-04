return {
   mk_map = function(mode, map, action, desc, opts)
      vim.keymap.set(mode, map, action, opts or {
         noremap = true, silent = true, desc = desc
      })
   end,
}
