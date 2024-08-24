{ lib, myLib, ... }:

{
  imports = [ ../options ] ++ (myLib.importFilesIn ./.);

  programs.home-manager.enable = true;

  # Disabled by plasma module
  xdg.mimeApps.enable = lib.mkDefault true;
}
