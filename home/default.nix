{ config, pkgs, lib, ... }:

{
  imports = [
    ./other
    ./productivity
    ./system
    ./utilities
  ];

  programs.home-manager.enable = true;

  # Disabled by plasma module
  xdg.mimeApps.enable = lib.mkDefault true;
}
