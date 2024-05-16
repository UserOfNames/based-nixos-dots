{ lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./newsboat
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./ytdlp.nix
  ];

  myHomeModules = {
    newsboat.enable = dtrue;
    mpd.enable = dtrue;
    mpv.enable = dtrue;
    ncmpcpp.enable = dtrue;
    ytdlp.enable = dtrue;
  };
}
