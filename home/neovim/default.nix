{ config, pkgs, ... }:

{
  programs.neovim =
  let
    # Credit to Vimjoyer on youtube
    toLua = str: "lua <<EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = toLuaFile ./plugins/treesitter.lua;
      }

      {
        plugin = vim-floaterm;
        config = toLuaFile ./plugins/floaterm.lua;
      }

      {
        plugin = nvim-tree-lua;
        config = toLua "require 'nvim-tree'.setup()";
      }

      {
        plugin = nvim-web-devicons;
        config = toLua "require 'nvim-web-devicons'.setup()";
      }

      vim-nix
      vim-fugitive
      vim-commentary
      vimwiki
      vim-numbertoggle
      vimtex
      base16-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}
