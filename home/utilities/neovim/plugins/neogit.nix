{ myLib, ... }:

let
  ng = ''require("neogit")'';
in {
  programs.nixvim = {
    plugins.neogit = {
      enable = true;

      settings = {
        kind = "vsplit";
      };
    };

    keymaps = with myLib.nixvim; [
      (mkFunctionMap [ "n" ] "<Leader>gs" ''${ng}.open()'' "Open neogit")
      (mkFunctionMap [ "n" ] "<Leader>gl" ''${ng}.open({"log"})'' "Open neogit log popup")
      (mkFunctionMap [ "n" ] "<Leader>gb" ''${ng}.open({"branch"})'' "Open neogit branch popup")
    ];
  };
}
