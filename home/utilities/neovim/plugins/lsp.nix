{ myLib, ... }:

{
  programs.nixvim.plugins.lsp = {
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
      ];
    };


    servers = {
      clangd.enable = true;
      hls.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
      pyright.enable = true;
    };
  };
}
