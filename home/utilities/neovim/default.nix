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
        pyright
        texliveFull
      ];

      plugins = with pkgs.vimPlugins; [
        # Workflow plugins
        nvim-treesitter.withAllGrammars
        friendly-snippets
        harpoon2
        luasnip
        mini-nvim
        nvim-autopairs
        oil-nvim
        trouble-nvim
        undotree
        vim-fugitive
        vim-numbertoggle

        # Telescope and dependencies
        plenary-nvim
        telescope-fzf-native-nvim
        telescope-nvim

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
        cmp_luasnip
      ];

      # Import all configs. Ugly solution but I can't seem to find a better one.
      extraLuaConfig = ''
        ${readFile ./init.lua}
        ${readFile ./mappings.lua}
        ${readFile ./autocmd/lua.lua}
        ${readFile ./autocmd/md.lua}
        ${readFile ./autocmd/nix.lua}

        ${readFile ./plugins/treesitter.lua}
        ${readFile ./plugins/harpoon.lua}
        ${readFile ./plugins/luasnip.lua}
        ${readFile ./plugins/mini.lua}
        ${readFile ./plugins/autopairs.lua}
        ${readFile ./plugins/oil.lua}
        ${readFile ./plugins/trouble.lua}
        ${readFile ./plugins/undotree.lua}
        ${readFile ./plugins/fugitive.lua}

        ${readFile ./plugins/telescope.lua}

        ${readFile ./plugins/lualine.lua}
        ${readFile ./plugins/nvim-web-devicons.lua}
        ${readFile ./plugins/zen-mode.lua}

        ${readFile ./plugins/vimtex.lua}
        ${readFile ./plugins/vimwiki.lua}

        ${readFile ./plugins/lsp/lsp-zero.lua}
        ${readFile ./plugins/lsp/cmp.lua}
        ${readFile ./plugins/lsp/ccls.lua}
        ${readFile ./plugins/lsp/lua_ls.lua}
        ${readFile ./plugins/lsp/nil_ls.lua}
        ${readFile ./plugins/lsp/pylsp.lua}
      '';
    };
  };
}
