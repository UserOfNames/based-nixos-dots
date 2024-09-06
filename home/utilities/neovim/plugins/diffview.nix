{ myLib, ... }:

{
  programs.nixvim = {
    plugins.diffview = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>gdd" "<cmd>DiffviewOpen<Enter>" "Open diffview")
    ];
  };
}
