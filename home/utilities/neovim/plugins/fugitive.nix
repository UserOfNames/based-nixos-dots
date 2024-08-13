{ myLib, ... }:

{
  programs.nixvim = {
    plugins.fugitive = {
      enable = true;
    };
    
    keymaps = with myLib.nixvim; [
      (mkOptMap [ "n" ] "<Leader>g " ":Git " "Populate command line with :Git" { noremap = true; })
      (mkOptMap [ "n" ] "<Leader>gl" ":Git log " "Populate command line with :Git log" { noremap = true; })

      (mkMap [ "n" ] "<Leader>gs" "<cmd>Git<Enter>" "Open fugitive status window")
      (mkMap [ "n" ] "<Leader>gb" "<cmd>Git branch<Enter>" "Open fugitive branch window")

      (mkMap [ "n" "v" ] "<Leader>gdd" "<cmd>Gvdiffsplit!<Enter>" "Open 3-way diff split")
      (mkMap [ "n" "v" ] "<Leader>gdh" "<cmd>diffget //2<Enter>" "Accept changes from left split")
      (mkMap [ "n" "v" ] "<Leader>gdl" "<cmd>diffget //3<Enter>" "Accept changes from right split")
    ];
  };
}
