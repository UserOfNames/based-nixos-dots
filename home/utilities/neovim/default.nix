{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.neovim;

  optional = plugin: {
    inherit plugin;
    optional = true;
  };
in {
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      # STATEVERSION FIX: 26.05
      withPython3 = false;
      withRuby = false;

      plugins = with pkgs.vimPlugins; [
        lz-n
        snacks-nvim
        nvim-treesitter.withAllGrammars
        oil-nvim
        tokyonight-nvim
        rustaceanvim
        vimtex
        nvim-lspconfig

        (optional mini-nvim)
        (optional nvim-autopairs)
        (optional blink-cmp)
        (optional friendly-snippets)
        (optional luasnip)
        (optional harpoon2)
        (optional lualine-nvim)
        (optional render-markdown-nvim)
        (optional undotree)
        (optional which-key-nvim)
        (optional diffview-nvim)
        (optional gitsigns-nvim)
        (optional neogit)
        (optional typst-preview-nvim)
      ];

      extraPackages = with pkgs; [
        clang-tools
        lua-language-server
        stylua
        nixd
        alejandra
        basedpyright
        tinymist
        typst
        texliveFull
      ];
    };

    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
