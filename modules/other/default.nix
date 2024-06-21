{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.other;
in {
  imports = [
    ../../options.nix
    ./gaming.nix
    ./stylix.nix
  ];
}
