{ ... }:

{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;

    keymaps = {
      addFile = "<Leader>ha";
      toggleQuickMenu = "<Leader>hh";

      navFile = {
        "1" = "<Leader>1";
        "2" = "<Leader>2";
        "3" = "<Leader>3";
        "4" = "<Leader>4";
        "5" = "<Leader>5";
        "6" = "<Leader>6";
        "7" = "<Leader>7";
        "8" = "<Leader>8";
        "9" = "<Leader>9";
      };
    };
  };
}
