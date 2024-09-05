{ myLib, ... }:

{
  programs.nixvim = {
    plugins.zen-mode = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkFunctionMap [ "n" ] "<Leader>oz" ''require("zen-mode").toggle({})'' "Toggle zenmode")
    ];
  };
}
