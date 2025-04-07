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
        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
        };

        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "gD" = "declaration";
          "go" = "type_definition";
          "gs" = "signature_help";
          "<F2>" = "rename";
          "<F3>" = "format";
          "<F4>" = "code_action";
        };

        extra = with myLib.nixvim; [
          (mkMap "n" "gi" "<cmd>Telescope lsp_implementations<Enter>" null)
          (mkMap "n" "gr" "<cmd>Telescope lsp_references<Enter>" null)
          (mkFunctionMap "n" "<Leader>lh" "vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())" "Toggle inlay hints")
          (mkFunctionMap "n" "<Leader>ld" "${toggle_virtual_text}" "Toggle inline LSP diagnostics")
          (mkFunctionMap "n" "<Leader>ll" "${toggle_virtual_line}" "Toggle inline LSP diagnostics")
        ];
      };


      servers = {
        clangd.enable = true;

        hls = {
          enable = true;
          installGhc = false;
        };

        lua_ls.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };

    diagnostics = {
      virtual_text = true;
    };
  };
}
