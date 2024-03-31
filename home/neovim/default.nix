{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      vim-floaterm
      nvim-tree-lua
      nvim-web-devicons
      lualine-nvim
      telescope-nvim
      undotree
      plenary-nvim
      telescope-fzf-native-nvim
      vim-nix
      vim-fugitive
      vim-commentary
      vimwiki
      vim-numbertoggle
      vimtex
      base16-nvim
    ];

    # Import all configs. Ugly solution but I can't seem to find a better one.
    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./mappings.lua}
      ${builtins.readFile ./autocmd/lua.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/floaterm.lua}
      ${builtins.readFile ./plugins/nvim-tree.lua}
      ${builtins.readFile ./plugins/nvim-web-devicons.lua}
      ${builtins.readFile ./plugins/lualine.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/undotree.lua}
    '';
  };
}
