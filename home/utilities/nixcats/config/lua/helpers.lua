return {
   mk_map = function(mode, map, action, desc)
      vim.keymap.set(mode, map, action, { noremap = true, silent = true, desc = desc })
   end
}
