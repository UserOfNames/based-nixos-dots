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
      nil
      nodePackages.pyright
    ];

    plugins = with pkgs.vimPlugins; [
      # Workflow plugins
      nvim-treesitter.withAllGrammars
      vim-floaterm
      vim-numbertoggle
      oil-nvim
      undotree
      vim-fugitive
      harpoon2
      mini-nvim
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
      cmp-buffer
      cmp-path
      luasnip
      lsp-zero-nvim
    ];

    # Import all configs. Ugly solution but I can't seem to find a better one.
    extraLuaConfig = ''
      ${readFile ./init.lua}
      ${readFile ./mappings.lua}
      ${readFile ./autocmd/lua.lua}
      ${readFile ./autocmd/nix.lua}
      ${readFile ./plugins/treesitter.lua}
      ${readFile ./plugins/floaterm.lua}
      ${readFile ./plugins/mini-nvim.lua}
      ${readFile ./plugins/oil-nvim.lua}
      ${readFile ./plugins/telescope.lua}
      ${readFile ./plugins/undotree.lua}
      ${readFile ./plugins/harpoon.lua}
      ${readFile ./plugins/nvim-web-devicons.lua}
      ${readFile ./plugins/lualine.lua}
      ${readFile ./plugins/vimtex.lua}
      ${readFile ./plugins/lsp/lsp-zero.lua}
      ${readFile ./plugins/lsp/lsp-cmp.lua}
      ${readFile ./plugins/lsp/lsp-lua_ls.lua}
      ${readFile ./plugins/lsp/lsp-nil_ls.lua}
      ${readFile ./plugins/lsp/lsp-pyright.lua}
    '';
  };
}
