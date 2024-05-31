{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.neovim = let readFile = file: builtins.readFile file; in {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        ccls
        lua-language-server
        nil
        nodePackages.pyright
      ];

      plugins = with pkgs.vimPlugins; [
        # Workflow plugins
        nvim-treesitter.withAllGrammars
        harpoon2
        mini-nvim
        oil-nvim
        toggleterm-nvim
        undotree
        vim-fugitive
        vim-numbertoggle
        vim-visual-multi

        # Telescope and dependencies
        telescope-nvim
        plenary-nvim
        telescope-fzf-native-nvim

        # Aesthetic plugins
        lualine-nvim
        nvim-web-devicons
        tokyonight-nvim
        zen-mode-nvim

        # Notetaking plugins
        vimtex
        vimwiki

        # LSP plugins
        nvim-lspconfig
        lsp-zero-nvim
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        luasnip
      ];

      # Import all configs. Ugly solution but I can't seem to find a better one.
      extraLuaConfig = ''
        ${readFile ./init.lua}
        ${readFile ./mappings.lua}
        ${readFile ./autocmd/lua.lua}
        ${readFile ./autocmd/nix.lua}
        ${readFile ./plugins/toggleterm.lua}
        ${readFile ./plugins/treesitter.lua}
        ${readFile ./plugins/mini.lua}
        ${readFile ./plugins/oil.lua}
        ${readFile ./plugins/telescope.lua}
        ${readFile ./plugins/undotree.lua}
        ${readFile ./plugins/harpoon.lua}
        ${readFile ./plugins/nvim-web-devicons.lua}
        ${readFile ./plugins/lualine.lua}
        ${readFile ./plugins/vimtex.lua}
        ${readFile ./plugins/zen-mode.lua}
        ${readFile ./plugins/lsp/lsp-zero.lua}
        ${readFile ./plugins/lsp/lsp-cmp.lua}
        ${readFile ./plugins/lsp/lsp-ccls.lua}
        ${readFile ./plugins/lsp/lsp-lua_ls.lua}
        ${readFile ./plugins/lsp/lsp-nil_ls.lua}
        ${readFile ./plugins/lsp/lsp-pylsp.lua}
      '';
    };
  };
}
