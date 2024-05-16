{ lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./hyprland
    ./waybar
    ./mako.nix
    ./zsh.nix
  ];

  myHomeModules = {
    hyprland.enable = dtrue;
    mako.enable = dtrue;
    waybar.enable = dtrue;
    zsh.enable = dtrue;
  };
}
