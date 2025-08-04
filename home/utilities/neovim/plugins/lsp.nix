{ myLib, ... }:

let
  toggle_virtual_text = ''
    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
    vim.diagnostic.config({ virtual_lines = false })
  '';

  toggle_virtual_line = ''
    vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    vim.diagnostic.config({ virtual_text = false })
  '';
in {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      keymaps = {
        lspBuf = {
          "go" = "type_definition";
          "grs" = "signature_help";
          "grf" = "format";
        };

        extra = with myLib.nixvim; [
          (mkMap "n" "gi" "<cmd>Telescope lsp_implementations<Enter>" null)
          (mkMap "n" "grr" "<cmd>Telescope lsp_references<Enter>" null)
          (mkFunctionMap "n" "<Leader>lh" "vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())" "Toggle inlay hints")
          (mkFunctionMap "n" "<Leader>ld" "${toggle_virtual_text}" "Toggle inline LSP diagnostics")
          (mkFunctionMap "n" "<Leader>ll" "${toggle_virtual_line}" "Toggle inline LSP diagnostics")
        ];
      };


      servers = {
        basedpyright.enable = true;
        clangd.enable = true;

        hls = {
          enable = true;
          installGhc = false;
        };

        jdtls.enable = true;
        lua_ls.enable = true;

        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
          };
        };
      };
    };

    diagnostic.settings = {
      virtual_text = true;
    };
  };
}
