{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./fastfetch.nix
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./newsboat
    ./ytdlp.nix
  ];

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      fastfetch.enable = dtrue;
      mpd.enable = dtrue;
      mpv.enable = dtrue;
      ncmpcpp.enable = dtrue;
      newsboat.enable = dtrue;
      ytdlp.enable = dtrue;
    };
  };
}
