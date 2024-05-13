{ lib, ... }:

{
  imports = [
    ./lf
    ./neovim
    ./waybar
    ./btop.nix
    ./firefox.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./tmux.nix
    ./xremap.nix
    ./zathura.nix
    ./zsh.nix
  ];

  myHomeModules.lf.enable = lib.mkDefault true;
  myHomeModules.neovim.enable = lib.mkDefault true;
  myHomeModules.waybar.enable = lib.mkDefault true;
  myHomeModules.btop.enable = lib.mkDefault true;
  myHomeModules.firefox.enable = lib.mkDefault true;
  myHomeModules.foot.enable = lib.mkDefault true;
  myHomeModules.fuzzel.enable = lib.mkDefault true;
  myHomeModules.git.enable = lib.mkDefault true;
  myHomeModules.tmux.enable = lib.mkDefault true;
  myHomeModules.xremap.enable = lib.mkDefault true;
  myHomeModules.zathura.enable = lib.mkDefault true;
  myHomeModules.zsh.enable = lib.mkDefault true;
}
