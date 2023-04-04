{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraLuaConfig = ''
      -- Nvim-tree configs
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      
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
      vim.keymap.set('n', '<M-h>', '<C-w>')

      -- Terminal maps
      vim.keymap.set('t', '<Esc>', '<C-Bslash><C-n>')
      vim.keymap.set('n', '<Leader>t', ':FloatermToggle <Enter>')
      vim.keymap.set('n', '<F9>', ':FloatermNext <Enter>')
      vim.keymap.set('t', '<F9>', '<C-Bslash> <C-n> :FloatermNext <Enter>')
      vim.keymap.set('n', '<F8>', ':FloatermPrev <Enter>')
      vim.keymap.set('t', '<F8>', '<C-Bslash> <C-n> :FloatermPrev <Enter>')
      vim.keymap.set('n', '<F7>', ':FloatermNew <Enter>')
      vim.keymap.set('t', '<F7>', '<C-Bslash> <C-n> :FloatermNew <Enter>')
      
      -- Main configs
      vim.o.syntax = true
      vim.o.number = true
      vim.o.hidden = true
      vim.o.hlsearch = false
      vim.o.foldmethod = 'syntax'
    '';

    plugins = [
      {
        plugin = pkgs.vimPlugins.nvim-treesitter;
      }
      {
        plugin = pkgs.vimPlugins.nvim-base16;
        config = ''
          colorscheme base16-tomorrow-night
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-tree-lua;
        config = ''
          lua require 'nvim-tree'.setup()
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-web-devicons;
        config = ''
          lua require 'nvim-web-devicons'.setup()
        '';
      }
      {
        plugin = pkgs.vimPlugins.vim-nix;
      }
      {
        plugin = pkgs.vimPlugins.vim-floaterm;
        config = ''
          hi Floaterm guibg = black
          hi FloatermBorder guibg = grey guifg = white
          let g:floaterm_position = "bottomright"
          let g:floaterm_height = 0.5
          let g:floaterm_width = 0.5
        '';
      }
    ];
  };
}
