{ config, pkgs, lib, ... }:

let
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

  config = {
    myHomeModules.other = lib.mkIf config.myHomeModules.other.enable {
      fastfetch.enable = dtrue;
      mpd.enable = dtrue;
      mpv.enable = dtrue;
      ncmpcpp.enable = dtrue;
      newsboat.enable = dtrue;
      ytdlp.enable = dtrue;
    };
  };
}
