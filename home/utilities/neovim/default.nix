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
        fff-nvim
        # TODO: nvim-treesitter is archived and should be replaced as soon as
        # a suitable alternative presents itself. It's only used to source
        # grammars and queries in my config.
        nvim-treesitter.withAllGrammars
        oil-nvim
        tokyonight-nvim
        rustaceanvim
        nvim-lspconfig

        (optional mini-nvim)
        (optional nvim-autopairs)
        (optional blink-cmp)
        (optional friendly-snippets)
        (optional luasnip)
        (optional harpoon2)
        (optional lualine-nvim)
        (optional render-markdown-nvim)
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
      ];
    };

    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
