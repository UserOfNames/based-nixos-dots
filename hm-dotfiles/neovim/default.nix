{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraLuaConfig = lib.fileContents ./init.lua;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-base16
      nvim-tree-lua
      nvim-web-devicons
      vim-nix
      vim-floaterm
      vim-fugitive
      vim-commentary
      vimwiki
      vim-numbertoggle
    ];
  };
}
