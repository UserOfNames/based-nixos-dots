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
    grim
    hyprpicker
    mpc-cli
    playerctl
    qalculate-qt
    qimgv
    ripdrag
    slurp
    swww
    texliveFull
    trashy
  ];
}
