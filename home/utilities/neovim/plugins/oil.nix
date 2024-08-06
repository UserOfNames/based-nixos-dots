{ myLib, ... }:

{
  programs.nixvim = {
    plugins.oil = {
      enable = true;

      settings = {
        default_file_explorer = true;

        view_options = {
          show_hidden = true;
        };

        keymaps = {
          "<C-l>" =  "actions.select";
          # "<C-x>" =  "actions.select"; # FIXME horizontal split
          "<C-->" =  "actions.refresh";
        };
      };
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>fe" "<cmd>Oil<Enter>" "Open oil in current buffer")
    ];
  };
}
