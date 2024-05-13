{ lib, ... }:

{
  imports = [
    ./newsboat
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./ytdlp.nix
  ];

  myHomeModules.newsboat.enable = lib.mkDefault true;
  myHomeModules.mpd.enable = lib.mkDefault true;
  myHomeModules.mpv.enable = lib.mkDefault true;
  myHomeModules.ncmpcpp.enable = lib.mkDefault true;
  myHomeModules.ytdlp.enable = lib.mkDefault true;
}
