{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./fastfetch.nix
    ./newsboat
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./ytdlp.nix
  ];

  options = {
    myHomeModules.other.enable = lib.mkEnableOption "Enable 'other' home module group";
  };

  config = {
    myHomeModules.other = lib.mkIf config.myHomeModules.other.enable {
      fastfetch.enable = dtrue;
      newsboat.enable = dtrue;
      mpd.enable = dtrue;
      mpv.enable = dtrue;
      ncmpcpp.enable = dtrue;
      ytdlp.enable = dtrue;
    };
  };
}
