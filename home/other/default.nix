{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other;
in {
  imports = [
    ../../options.nix
    ./newsboat
    ./fastfetch.nix
    ./stylix.nix
    ./ytdlp.nix
  ];
}
