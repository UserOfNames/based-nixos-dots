{ myLib, ... }:

{
  programs.nixvim = {
    plugins.undotree = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>u" "<cmd>UndotreeToggle<Enter>" "Toggle undotree")
    ];
  };
}
