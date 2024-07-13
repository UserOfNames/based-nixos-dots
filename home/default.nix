{ config, pkgs, outputs, ... }:

{
  imports = [
    ./other
    ./productivity
    ./system
    ./utilities
  ];

  programs.home-manager.enable = true;

  xdg.mimeApps.enable = true;
}
