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
    hyprpicker
    mpc-cli
    qalculate-qt
    qimgv
    ripdrag
    swww
    texliveFull
    trashy
    ueberzugpp
  ];
}
