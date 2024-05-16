{ lib, ... }:

{
  imports = [
    ./hyprland
    ./waybar
    ./mako.nix
    ./zsh.nix
  ];

  myHomeModules.mako.enable = lib.mkDefault true;
  myHomeModules.waybar.enable = lib.mkDefault true;
  myHomeModules.zsh.enable = lib.mkDefault true;
}
