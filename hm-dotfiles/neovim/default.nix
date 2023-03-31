{ config, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      -- Maps
      vim.g.mapleader = ","
  
      -- All modes
      vim.keymap.set({'n', 'v', 'i'}, '<Leader>s', function() vim.opt.spell = not(vim.opt.spell:get()) end)
    
      -- Normal mode
      vim.keymap.set ('n', '<Space>', 'i<Space><Right><Esc>')
      vim.keymap.set ('n', '<Enter>', 'o<Esc>')
    
      -- Main configs
      vim.o.syntax = true
      vim.o.number = true
      vim.o.hidden = true
      vim.o.hlsearch = false
    '';
  };
}
