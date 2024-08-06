{ lib, myLib, ... }:

{
  imports = [] ++ (myLib.importHelper ./.);

  programs.home-manager.enable = true;

  # Disabled by plasma module
  xdg.mimeApps.enable = lib.mkDefault true;
}
