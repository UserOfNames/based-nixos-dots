{ myLib, ... }:

{
  programs.nixvim = {
    plugins.diffview = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>gdd" "<cmd>DiffviewOpen<Enter>" "Open diffview")
      (mkMap [ "n" "v" ] "<Leader>gdh" "<cmd>diffget //2<Enter>" "Accept changes from left split")
      (mkMap [ "n" "v" ] "<Leader>gdl" "<cmd>diffget //3<Enter>" "Accept changes from right split")
    ];
  };
}
