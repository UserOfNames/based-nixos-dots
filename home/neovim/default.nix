{ config, pkgs, ... }:

{
  programs.neovim = let readFile = file: builtins.readFile file; in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      # Workflow plugins
      nvim-treesitter.withAllGrammars
      vim-floaterm
      vim-numbertoggle
      oil-nvim
      undotree
      vim-nix
      vim-fugitive
      vim-commentary
      # Telescope and dependencies
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim

      # Aesthetic plugins
      nvim-web-devicons
      base16-nvim
      lualine-nvim

      # Notetaking plugins
      vimtex
      vimwiki

      # LSP plugins
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      lsp-zero-nvim
    ];

    # Import all configs. Ugly solution but I can't seem to find a better one.
    extraLuaConfig = ''
      ${readFile ./init.lua}
      ${readFile ./mappings.lua}
      ${readFile ./autocmd/lua.lua}
      ${readFile ./plugins/treesitter.lua}
      ${readFile ./plugins/floaterm.lua}
      ${readFile ./plugins/oil-nvim.lua}
      ${readFile ./plugins/nvim-web-devicons.lua}
      ${readFile ./plugins/lualine.lua}
      ${readFile ./plugins/telescope.lua}
      ${readFile ./plugins/undotree.lua}
    '';
  };
}
