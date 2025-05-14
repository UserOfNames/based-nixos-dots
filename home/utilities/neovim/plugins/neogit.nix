{ myLib, ... }:

{
  programs.nixvim = {
    plugins.neogit = {
      enable = true;

      settings = {
        kind = "vsplit";
      };

      lazyLoad = {
        settings = {
          cmd = "Neogit";
        };
      };
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>gs" "<cmd>Neogit<Enter>" "Open neogit")
      (mkMap [ "n" ] "<Leader>gl" "<cmd>Neogit log<Enter>" "Open neogit")
      (mkMap [ "n" ] "<Leader>gb" "<cmd>Neogit branch<Enter>" "Open neogit")
    ];
  };
}
