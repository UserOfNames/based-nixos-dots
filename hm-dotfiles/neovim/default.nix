{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = [
      {
        plugin = pkgs.vimPlugins.nvim-tree-lua;
	config = ''
          packadd! nvim-tree.lua
	  lua require 'nvim-tree'.setup()
	'';
      }
    ];

    extraLuaConfig = ''
      -- Maps
      vim.g.mapleader = ","
  
      -- All modes
      vim.keymap.set({'n', 'v', 'i'}, '<Leader>s', function() vim.opt.spell = not(vim.opt.spell:get()) end)
      vim.keymap.set({'n', 'v', 'i'}, '<Leader>f', '<Esc>:NvimTreeToggle <Enter>')
    
      -- Normal mode
      vim.keymap.set('n', '<Space>', 'i<Space><Right><Esc>')
      vim.keymap.set('n', '<Enter>', 'o<Esc>')
      vim.keymap.set('n', '<M-k>', '<C-w>k')
      vim.keymap.set('n', '<M-j>', '<C-w>j')
      vim.keymap.set('n', '<M-l>', '<C-w>l')
      vim.keymap.set('n', '<M-h>', '<C-w>h')
    
      -- Main configs
      vim.o.syntax = true
      vim.o.number = true
      vim.o.hidden = true
      vim.o.hlsearch = false
    '';
  };
}
