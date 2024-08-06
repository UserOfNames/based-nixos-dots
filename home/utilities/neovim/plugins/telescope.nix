{ ... }:

let
  mkTelescopeMap = mode: key: action: {
    key = { inherit mode action; };
  };
in {
  programs.nixvim.plugins.telescope = {
    enable = true;

    extensions ={
      fzf-native.enable = true;
    };

    keymaps = {
      "<Leader>ff" = "find_files";
      "<Leader>fb" = "buffers";
      "<Leader>fg" = "git_files";
      "<Leader>fs" = "live_grep";
      "<Leader>fd" = "diagnostics";
    };
  };
}
