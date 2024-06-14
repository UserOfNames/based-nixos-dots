{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./newsboat
    ./fastfetch.nix
    ./ytdlp.nix
  ];

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      fastfetch.enable = dtrue;
      newsboat.enable = dtrue;
      ytdlp.enable = dtrue;
    };
  };
}
