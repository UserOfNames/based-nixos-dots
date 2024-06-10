{ config, pkgs, outputs, ... }:

{
  imports = [
    ./system
    ./utilities
    ./other
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    calcurse
    foliate
    hyprpicker
    mpc-cli
    mpd-mpris
    playerctl
    qalculate-qt
    qimgv
    ripdrag
    swww
    texliveFull
    trashy
  ];
}
