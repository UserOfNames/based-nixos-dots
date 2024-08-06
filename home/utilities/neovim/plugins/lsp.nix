{ myLib, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;

    keymaps.extra = with myLib.nixvim; [
      (mkMap "n" "gr" "<cmd>Telescope lsp_references<Enter>" null)
    ];

    servers = {
      lua-ls.enable = true;
      nil-ls.enable = true;
      pylsp.enable = true;
    };
  };
}
