{ myLib, ... }:

let
  hp = ''require("harpoon")'';
  hl = ''require("harpoon"):list():select'';
in {
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = with myLib.nixvim; [
      (mkFunctionMap [ "n" ] "<Leader>ha" ''${hp}:list():add()'' "Add file to harpoon")
      (mkFunctionMap [ "n" ] "<Leader>hh" ''${hp}.ui:toggle_quick_menu(${hp}:list())'' "Open harpoon menu")

      (mkFunctionMap [ "n" ] "<Leader>1" ''${hl}(1)'' "Navigate to harpoon file 1")
      (mkFunctionMap [ "n" ] "<Leader>2" ''${hl}(2)'' "Navigate to harpoon file 2")
      (mkFunctionMap [ "n" ] "<Leader>3" ''${hl}(3)'' "Navigate to harpoon file 3")
      (mkFunctionMap [ "n" ] "<Leader>4" ''${hl}(4)'' "Navigate to harpoon file 4")
      (mkFunctionMap [ "n" ] "<Leader>5" ''${hl}(5)'' "Navigate to harpoon file 5")
      (mkFunctionMap [ "n" ] "<Leader>6" ''${hl}(6)'' "Navigate to harpoon file 6")
      (mkFunctionMap [ "n" ] "<Leader>7" ''${hl}(7)'' "Navigate to harpoon file 7")
      (mkFunctionMap [ "n" ] "<Leader>8" ''${hl}(8)'' "Navigate to harpoon file 8")
      (mkFunctionMap [ "n" ] "<Leader>9" ''${hl}(9)'' "Navigate to harpoon file 9")
    ];
  };
}
