{ myLib, ... }:

{
  programs.nixvim = {
    plugins.zen-mode = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>oz" {
        __raw = ''function() require("zen-mode").toggle({}) end'';
      } "Toggle zenmode")
    ];
  };
}
