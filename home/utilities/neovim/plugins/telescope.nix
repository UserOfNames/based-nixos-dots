{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;

    extensions ={
      fzf-native.enable = true;
    };

    settings = {
      defaults = {
        mappings = {
          i = {
            "<C-l>" = "select_default";
            "<C-s>" = "select_vertical";
          };

          n = {
            "<Space>" = "select_default";
            "<C-l>" = "select_default";
            "<C-s>" = "select_vertical";
          };
        };
      };
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
