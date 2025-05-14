{ myLib, ... }:

let
  gs = ''require("gitsigns")'';
in {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;

      lazyLoad = {
        settings = {
          event = "DeferredUIEnter";
        };
      };
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>ghh" "<cmd>Gitsigns<Enter>" "Open gitsigns menu")

      (mkFunctionMap [ "n" ] "]h" ''${gs}.nav_hunk("next")'' "Next hunk")
      (mkFunctionMap [ "n" ] "[h" ''${gs}.nav_hunk("prev")'' "Previous hunk")

      (mkFunctionMap [ "n" ] "<Leader>ghs" ''${gs}.stage_hunk()'' "Stage hunk")

      (mkFunctionMap [ "n" ] "<Leader>ghu" ''${gs}.undo_stage_hunk()'' "Undo stage hunk")

      (mkFunctionMap [ "n" ] "<Leader>ghr" ''${gs}.reset_hunk()'' "Reset hunk")

      (mkFunctionMap [ "n" ] "<Leader>ghp" ''${gs}.preview_hunk()'' "Preview hunk")
    ];
  };
}
