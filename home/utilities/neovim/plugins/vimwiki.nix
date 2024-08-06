{ pkgs, myLib, ... }:

{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.vimwiki ];

    keymaps = with myLib.nixvim; [
      # Remap default list binds since I use <C-l> for enter
      (mkMap [ "i" ] "<C-y><C-j>" "<Plug>VimwikiListNextSymbol" "Vimwiki: Next list symbol")
      (mkMap [ "i" ] "<C-y><C-k>" "<Plug>VimwikiListPrevSymbol" "Vimwiki: Previous list symbol")
      (mkMap [ "i" ] "<C-y><C-m>" "<Plug>VimwikiListToggle" "Vimwiki: Toggle list")
    ];
  };
}
