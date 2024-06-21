{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system;
in {
  imports = [
    ../../options.nix
    ./hyprland
    ./zsh.nix
  ];
}
