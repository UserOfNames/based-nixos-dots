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
    fastfetch
    hydrus
    mpc-cli
    qalculate-qt
    qimgv
    ripdrag
    swww
    texliveFull
    trashy
    # FIXME delete
    notify-desktop
  ];
}
