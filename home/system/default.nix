{ lib, ... }:

{
  imports = [
    ./hyprland
    ./mako.nix
  ];

  myHomeModules.mako.enable = lib.mkDefault true;
}
