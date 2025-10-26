{ config, lib, inputs, ... }:

let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  config = {
    nixCats = {
      enable = true;
      # this will add the overlays from ./overlays and also,
      # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
      # It will not apply to overall system, just nixCats.
      addOverlays = /* (import ./overlays inputs) ++ */ [
        (utils.standardPluginOverlay inputs)
      ];

      packageNames = [ "nvimFull" ];

      luaPath = ./config;

      # the .replace vs .merge options are for modules based on existing configurations,
      # they refer to how multiple categoryDefinitions get merged together by the module.
      # :help nixCats.flake.outputs.categories
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          programming = {
            clang = with pkgs; [
              clang-tools
            ];

            latex = with pkgs; [
              texliveFull
            ];

            lua = with pkgs; [
              lua-language-server
              stylua
            ];

            nix = with pkgs; [
              nixd
              alejandra
            ];

            python = with pkgs; [
              basedpyright
            ];

            typst = with pkgs; [
              tinymist
              typst
            ];
          };
        };

        startupPlugins = {
          core = with pkgs.vimPlugins; [
            lz-n
            snacks-nvim

            # conform-nvim
            # nvim-dap
            # nvim-dap-ui
            # nvim-dap-virtual-text
            # nvim-lint
          ];

          ui = with pkgs.vimPlugins; [
            oil-nvim
            tokyonight-nvim
          ];

          programming = {
            default = with pkgs.vimPlugins; [
              nvim-lspconfig
            ];

            latex = with pkgs.vimPlugins; [
              vimtex
            ];

            rust = with pkgs.vimPlugins; [
              rustaceanvim
            ];
          };
        };

        optionalPlugins = {
          core = with pkgs.vimPlugins; [
            mini-nvim
            nvim-autopairs
            nvim-treesitter.withAllGrammars
          ];

          completion = with pkgs.vimPlugins; [
            blink-cmp
            friendly-snippets
            luasnip
          ];

          ui = with pkgs.vimPlugins; [
            harpoon2
            lualine-nvim
            render-markdown-nvim
            undotree
            which-key-nvim
          ];

          programming = with pkgs.vimPlugins; {
            git = [
              diffview-nvim
              gitsigns-nvim
              neogit
            ];

            typst = with pkgs.vimPlugins; [
              typst-preview-nvim
            ];
          };
        };

        extraCats = {
          programming = [
            [ "programming" "default" ]
          ];
        };

        # shared libraries to be added to LD_LIBRARY_PATH
        # variable available to nvim runtime
        sharedLibraries = {
          core = with pkgs; [];
        };

        # Environment variables available to neovim at runtime
        environmentVariables = {};

        # categories of the function you would have passed to withPackages
        python3.libraries = {};

        # If you know what these are, you can provide custom ones by category here.
        # If you dont, check this link out:
        # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
        extraWrapperArgs = {
          # test = [
          #   '' --set CATTESTVAR2 "It worked again!"''
          # ];
        };
      });

      # :help nixCats.flake.outputs.packageDefinitions
      packageDefinitions.replace = {
        nvimFull = {pkgs, name, ... }: {
          # :help nixCats.flake.outputs.settings
          settings = {
            suffix-path = true;
            suffix-LD = true;

            wrapRc = true;
            unwrappedCfgPath = null;

            aliases = [ "nvim" "vim" "vi" ];
          };

          categories = {
            core = true; # Core should always be enabled
            completion = true;
            ui = true;
            programming = {
              clang = true;
              git = true;
              latex = true;
              lua = true;
              nix = true;
              python = true;
              rust = true;
              typst = true;
            };
          };

          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
